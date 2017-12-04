<?php

  require_once('letter-avatar/vendor/autoload.php');
  require_once('letter-avatar/src/LetterAvatar.php');
  use YoHang88\LetterAvatar\LetterAvatar;

  // $name=$_GET['name'];
  // $avatar = new LetterAvatar($name);
  //header('Content-type: image/png');
  
  function getBase64Avatar($name) {
    $avatar = new LetterAvatar($name, 'circle', 240);
    return $avatar->getPng();
  }

