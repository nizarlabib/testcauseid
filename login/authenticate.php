<?php
session_start();

include "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $sql = "SELECT * FROM `users` WHERE `username` = :username";
    $statement = $pdo->prepare($sql);
    $statement->bindParam(':username', $username);
    $statement->execute();
    
    $user = $statement->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['user_password'])) {
        $_SESSION["username"] = $username;

        $tokenPayload = [
            "username" => $username,
            "timestamp" => time(),
            "exp" => time() + 3600,
        ];
        $token = base64_encode(json_encode($tokenPayload));

        $_SESSION["token"] = $token;

        $updateSql = "UPDATE `users` SET `token` = :token WHERE `username` = :username";
        $updateStatement = $pdo->prepare($updateSql);
        $updateStatement->bindParam(':token', $token);
        $updateStatement->bindParam(':username', $username);
        $updateStatement->execute();

        header('Location: http://localhost:3000/'); 
        exit();
    } else {
        echo "Invalid username or password.";
    }
}
?>
