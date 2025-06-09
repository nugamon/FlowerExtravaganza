<?php
session_start();

$_SESSION = array();

// Удаляем куки, связанные с текущей сессией
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Уничтожаем сессию
session_destroy();

// Перенаправляем пользователя на страницу авторизации
header("Location: index.php");
exit;
?>
