<?php
$data = json_decode(file_get_contents('php://input'), true);
$email = $data['email'];
$password = $data['password'];

$pdo = new PDO('mysql:host=localhost;dbname=your_database_name', 'your_username', 'your_password');
$sql = 'SELECT Password FROM Users WHERE Email = ?';
$stmt = $pdo->prepare($sql);
$stmt->execute([$email]);
$row = $stmt->fetch();

$success = false;
if ($row && password_verify($password, $row['Password'])) {
    $success = true;
}

header('Content-Type: application/json');
echo json_encode(['success' => $success]);
?>