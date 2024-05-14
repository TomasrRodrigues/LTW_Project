<?php
$data = json_decode(file_get_contents('php://input'), true);
$name = $data['name'];
$username = $data['username'];
$email = $data['email'];
$password = password_hash($data['password'], PASSWORD_DEFAULT);

$pdo = new PDO('mysql:host=localhost;dbname=your_database_name', 'your_username', 'your_password');
$sql = 'INSERT INTO Users (Name, Username, Email, Password) VALUES (?, ?, ?, ?)';
$stmt = $pdo->prepare($sql);
$success = $stmt->execute([$name, $username, $email, $password]);

header('Content-Type: application/json');
echo json_encode(['success' => $success]);
?>