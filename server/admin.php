<?php
  require_once __DIR__ . '/vendor/autoload.php';

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
    $username = $request->username;
    $password = $request->password;

    if ($username == 'root' && $password == '87654321') {

      $_SESSION['admin'] = true;

      return json_encode([
        "code" => 0,
        "message" => "success"
      ]);
    }

    return json_encode([
      "code" => -1,
      "message" => "Sai roi em"
    ]);
  });

  $app->respond('POST', '/logout', function($request) {
    unset($_SESSION['admin']);

    return json_encode([
      "code" => 0,
      "message" => "Success"
    ]);
  });
  
  $app->respond('GET', '/check-login', function($request) {
    if (!isset($_SESSION["admin"])) {
      return json_encode([
          "code" => -1,
          "message" => "Chưa đăng nhập"
      ]);
    }
    else {
      return json_encode([
        "code" => 0,
        "message" => "Đã đăng nhập"
      ]);
    }
  });

  $app->respond('GET', '/user-list', function($request) {
    if (!isset($_SESSION["admin"])) {
      return json_encode([
        "code" => -1,
        "message" => "Chưa đăng nhập"
      ]);
    }
    global $conn;
    
    $sql = "SELECT * FROM account";
    $query = mysqli_query($conn, $sql);
    $res = [];
    while ($row = mysqli_fetch_array($query, MYSQLI_ASSOC)) {
      $account = $row['id'];
      $sql_count = "SELECT COUNT(ID) FROM topic WHERE ACCOUNT = '$account'";
      $query_count = mysqli_query($conn, $sql_count);
      $count = mysqli_fetch_array($query_count);
      $row['topics'] = $count[0];
      $res[] = $row;
    }

    return json_encode([
      "code" => 0,
      "message" => "Success",
      "data" => $res
    ]);
  });

  $app->respond('POST', '/remove-user', function($request) {
    if (!isset($_SESSION["admin"])) {
      return json_encode([
        "code" => -1,
        "message" => "Chưa đăng nhập"
      ]);
    }
    global $conn;
    $id = $request->id;
    $sql = "DELETE FROM account WHERE ID = $id";
    $query = mysqli_query($conn, $sql);
    if (!$request) {
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

  $app->dispatch();

?>