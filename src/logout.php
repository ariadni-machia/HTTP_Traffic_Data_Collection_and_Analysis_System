<?php
    session_start();

    unset($_SESSION['loggedIN']);
    unset($_SESSION['loggedINA']);
    session_destroy();
    header('Location: index.html');
    exit();
?>