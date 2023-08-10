<?php
include "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $user_firstname = $_POST["user_firstname"];
    $user_lastname = $_POST["user_lastname"];
    $user_password = password_hash($_POST["user_password"], PASSWORD_DEFAULT);

    // Gunakan parameterized query (prepared statement) untuk mencegah SQL injection
    $sql = "INSERT INTO `users` (`username`, `user_firstname`, `user_lastname`, `user_password`) VALUES (:username, :user_firstname, :user_lastname, :user_password)";
    
    $statement = $pdo->prepare($sql);
    $statement->bindParam(':username', $username);
    $statement->bindParam(':user_firstname', $user_firstname);
    $statement->bindParam(':user_lastname', $user_lastname);
    $statement->bindParam(':user_password', $user_password);
    
    $inserted = $statement->execute();
    
    if ($inserted) {
        header('Location: login.php'); 
    }
}
?>
