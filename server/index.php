<?php 
    require_once __DIR__ . '/vendor/autoload.php';
    require_once __DIR__ . '/avatar.php';

    require('connect.php');

    $app = new \Klein\Klein();
    $host = isset($_SERVER['HTTP_ORIGIN'])? $_SERVER['HTTP_ORIGIN'] : $_SERVER['HTTP_HOST'];
    
    header("Access-Control-Allow-Origin: " . $host);
    header('Access-Control-Allow-Credentials: true');
    header('Content-Type: application/json');

    $base  = dirname($_SERVER['PHP_SELF']);
    if(ltrim($base, '/')){ 
        $_SERVER['REQUEST_URI'] = substr($_SERVER['REQUEST_URI'], strlen($base));
    }

    session_start();

    $app->respond('POST', '/login', function($request) {
        global $conn;

        $email = $request->email;
        $password = $request->password;
        
        $sql = "SELECT ID, FULLNAME FROM account WHERE PASSWORD = '$password' AND EMAIL = '$email'";   
        $query = mysqli_query($conn, $sql);
        if ($row = mysqli_fetch_array($query, MYSQLI_ASSOC))  {
            $_SESSION["id"] = $row["ID"];
            return json_encode([
                "code" => 0,
                "message" => "success",
                "data" => $row
            ]);
        }
        return json_encode([
            "code" => -1,
            "message" => "Sai tên đăng nhập hoặc mật khẩu..."
        ]); 
    });

    $app->respond('POST', '/logout', function() {
        unset($_SESSION["id"]);

        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/check-email', function($request) {
        global $conn;

        $email = $request->email;
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
          return json_encode([
                "code" => -1,
                "message" => "Email không hợp lệ!!!"
            ]);
        }

        $sql = "SELECT EMAIL FROM account WHERE EMAIL = '$email'";
        $query = mysqli_query($conn, $sql);

        if (mysqli_fetch_array($query)) {
            return json_encode([
                "code" => -1,
                "message" => "Email đã tồn tại!!!"
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('GET', '/check-login', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }

        global $conn;
        $id = $_SESSION["id"];
        
        $sql = "SELECT ID, FULLNAME, EMAIL FROM account WHERE ID = '$id'";
        $query = mysqli_query($conn, $sql);

        if ($row = mysqli_fetch_array($query, MYSQLI_ASSOC))  {
            $_SESSION["id"] = $row["ID"];
            return json_encode([
                "code" => 0,
                "message" => "success",
                "data" => $row
            ]);
        }

        return json_encode([
            "code" => -1,
            "message" => "Lỗi gì đó ai biết",
        ]);
    });

    $app->respond('POST', '/register', function($request) {
        global $conn;

        $email = $request->email;
        $password = $request->password;
        $fullname = $request->fullname;

        $sql = "SELECT EMAIL FROM account WHERE EMAIL = '$email'";
        $query = mysqli_query($conn, $sql);

        if (mysqli_fetch_array($query)) {
            return json_encode([
                "code" => -1,
                "message" => "Email đã tồn tại!!!"
            ]);
        }

        $sql = "INSERT INTO account(EMAIL, PASSWORD, FULLNAME) VALUES('$email', '$password', '$fullname')";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/update-info', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        
        global $conn;
        $id = $_SESSION["id"];
        $fullname = $request->fullname;
        $sql = "UPDATE account SET FULLNAME = '$fullname' WHERE ID = '$id'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/change-password', function($request){
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $id = $_SESSION["id"];
        $oldPassword = $request->oldPassword;
        $newPassword = $request->newPassword;

        $sql = "SELECT id from account WHERE ID = '$id' AND PASSWORD = '$oldPassword'";
        $query = mysqli_query($conn, $sql);
        if ($row = mysqli_fetch_all($query)) {
            $sql = "UPDATE account SET PASSWORD = '$newPassword' WHERE ID = '$id'";
            $query = mysqli_query($conn, $sql);
            if (!$query) {
                $error = mysqli_error($conn);
                return json_encode([
                    "code" => -1,
                    "message" => $error
                ]);
            }
            return json_encode([
                "code" => 0,
                "message" => "Success"
            ]);
        }
        else {
            return json_encode([
                "code" => -2,
                "message" => "Sai mật khẩu rồi nha"
            ]);
        }

    });

    $app->respond('GET', '/topic-list', function() {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $id = $_SESSION["id"];
        
        $sql = "SELECT ID, NAME, DESCRIPTION FROM topic WHERE ACCOUNT = '$id'";
        $query = mysqli_query($conn, $sql);
        $res = [];
        while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
            $res[] = $row;
        }
        
        return json_encode([
            "code" => 0,
            "message" => "success",
            "data" => $res
        ]);
    });

    $app->respond('POST', '/create-topic', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        $name = $request->name;
        $description = $request->description;
        $id = $_SESSION["id"];

        global $conn;
        $sql = "INSERT INTO topic(NAME, DESCRIPTION, ACCOUNT) VALUES('$name', '$description', '$id')";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);

    });

    $app->respond('POST', '/remove-topic', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        $id = $_SESSION["id"];
        $id_topic = $request->id;

        global $conn;
        $sql = "DELETE FROM topic WHERE ID = '$id_topic' AND ACCOUNT = '$id'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/update-topic', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        $id = $_SESSION["id"];
        $id_topic = $request->id;
        $name_topic = $request->name;
        $description_topic = $request->description;

        global $conn;
        $sql = "UPDATE topic SET NAME = '$name_topic', DESCRIPTION = '$description_topic' WHERE ID = '$id_topic' AND ACCOUNT = '$id'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('GET', '/topic-list/[i:id]/question-list', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        
        global $conn;
        $id = $_SESSION["id"];
        $topic_id = $request->id;

        $sql = "SELECT * FROM question WHERE TOPIC = '$topic_id'";
        $query = mysqli_query($conn, $sql);
        $res = [];
        while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
            $id_question = $row['id'];
            $answers = [];
            
            $sql_anwser = "SELECT * FROM answer WHERE QUESTION = '$id_question'";
            $query_anwser = mysqli_query($conn, $sql_anwser);
            while ($answer = mysqli_fetch_array($query_anwser, MYSQLI_ASSOC)) {
                $answers[] = $answer;
            }
            $row["answers"] = $answers;
            $res[] = $row;
            
        }
        return json_encode([
            "code" => 0,
            "message" => "Success",
            "data" => $res
        ]);
    });

    $app->respond('POST', '/topic-list/[i:id]/add-question', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        
        global $conn;
        $question_content = $request->content;
        $topic = $request->id;
        $sql = "INSERT INTO question(CONTENT, TOPIC) VALUES('$question_content', '$topic')";
        $query = mysqli_query($conn, $sql);
        $question_id = mysqli_insert_id($conn);
        $answers = $request->answers;
        foreach ($answers as $answer) {
            $isRight = (isset($answer["isRight"]) && $answer["isRight"] == 1)? 1 : 0;
            $content = $answer["content"];
            $sql = "INSERT INTO answer(CONTENT, QUESTION, ISRIGHT) VALUES('$content', '$question_id', '$isRight')";
            $query = mysqli_query($conn, $sql);
        }
        return json_encode([
            "code" => 0,
            "nessage" => "Success"
        ]);
    });
    
    $app->respond('POST', '/remove-question', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        
        global $conn;
        $id_question = $request->id;
        $sql = "DELETE FROM question WHERE ID = '$id_question'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });
    $app->respond('POST', '/update-question', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }

        global $conn;
        $question_id = $request->id;
        $question_content = $request->content;
        $answers = $request->answers;
        $sql = "UPDATE question SET CONTENT = '$question_content' WHERE ID = '$question_id'";
        $query = mysqli_query($conn, $sql);
        foreach ($answers as $answer) {
            $isRight = (isset($answer["isRight"]) && $answer["isRight"] == 1)? 1 : 0;
            $content = $answer["content"];
            $id = $answer["id"];
            $sql = "UPDATE answer SET CONTENT = '$content', ISRIGHT = '$isRight' WHERE ID = '$id'";
            $query = mysqli_query($conn, $sql);
        }
        return json_encode([
            "code" => 0,
            "nessage" => "Success"
        ]);
    });
    

    $app->respond('GET', '/topic-list/[i:id]/exam-list', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }

        global $conn;
        $topic_id = $request->id;

        $sql = "SELECT * FROM exam WHERE TOPIC = $topic_id";
        $query = mysqli_query($conn, $sql);
        $res = [];
        while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
            $res[] = $row;
        }
        
        return json_encode([
            "code" => 0,
            "nessage" => "Success",
            "data" => $res
        ]);
    });
    
    $app->respond('GET', '/exam-list/[i:id]/question-list', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }

        global $conn;
        $exam_id = $request->id;
        $sql = "SELECT * FROM question, exam_question WHERE id_exam = '$exam_id' AND id = id_question";
        $query = mysqli_query($conn, $sql);
        $res = [];
        while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
            $id_question = $row['id'];
            $answers = [];

            $sql_anwser = "SELECT * FROM answer WHERE QUESTION = '$id_question'";
            $query_anwser = mysqli_query($conn, $sql_anwser);
            while ($answer = mysqli_fetch_array($query_anwser, MYSQLI_ASSOC)) {
                $answers[] = $answer;
            }
            $row["answers"] = $answers;
            $res[] = $row;
        }

        return json_encode([
            "code" => 0,
            "nessage" => "Success",
            "data" => $res
        ]);        
    });

    $app->respond('POST', '/exam-list/[i:id]/remove-question', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $exam_id = $request->id;
        $question_id = $request->question_id;
        $sql = "DELETE FROM exam_question WHERE id_question = '$question_id' AND id_exam = '$exam_id'";
        $query = mysqli_query($conn, $sql);

        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);        
    });

    $app->respond('POST', '/exam-list/[i:id]/add-question', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $id_exam = $request->id;
        $questions = $request->questions;       //array [1, 3, 4, 5]
        foreach ($questions as $question) {
            $sql = "INSERT INTO exam_question(id_exam, id_question) VALUES('$id_exam', '$question')";
            $query = mysqli_query($conn, $sql);
        }

        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/remove-exam', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $id_exam = $request->id;

        $sql = "DELETE FROM exam WHERE ID = '$id_exam'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }
        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/topic-list/[i:id]/create-exam', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }

        global $conn;
        $topic_id = $request->id;
        $exam_name = $request->name;
        $exam_description = $request->description;
        $questions = $request->questions;

        $sql = "INSERT INTO exam(NAME, DESCRIPTION, TOPIC) VALUES('$exam_name', '$exam_description', '$topic_id')";
        $query = mysqli_query($conn, $sql);
        $exam_id = mysqli_insert_id($conn);
        foreach($questions as $question) {
            $sql = "INSERT INTO exam_question(ID_EXAM, ID_QUESTION) VALUES('$exam_id', '$question')";
            $query = mysqli_query($conn, $sql);
        }

        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('POST', '/update-exam', function($request) {
        if (!isset($_SESSION["id"])) {
            return json_encode([
                "code" => -1,
                "message" => "Chưa đăng nhập"
            ]);
        }
        global $conn;
        $name = $request->name;
        $description = $request->description;
        $id_exam = $request->id;

        $sql = "UPDATE exam SET NAME = '$name', DESCRIPTION = '$description' WHERE ID = '$id_exam'";
        $query = mysqli_query($conn, $sql);
        if (!$query) {
            $error = mysqli_error($conn);
            return json_encode([
                "code" => -1,
                "message" => $error
            ]);
        }

        return json_encode([
            "code" => 0,
            "message" => "Success"
        ]);
    });

    $app->respond('GET', '/avatar/[:name]', function($request) {
        $name = $request->name;
        header('Content-type: image/png');
        return getBase64Avatar($name);
    });

    $app->dispatch();
?>