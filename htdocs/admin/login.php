<?php
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
// include (MODEL_PATH . '/model.php');//数据库操作基类
// include (MODEL_PATH . '/adminModel.php');//管理员类

$adminModel = new adminModel();
$param['username'] = isset($_POST['username']) ? $_POST['username'] : '';
$param['password'] = isset($_POST['password']) ? $_POST['password'] : '';

$result = $adminModel->validate_admin($param);

if ($result == true) {
	session_start();
	$_SESSION['admin_login'] = true;
	$_SESSION['username'] = $param['username'];
	exit(header('Location:' . ADMIN_URL . '/home.php'));
} else {
	$error_msg = '账户名或密码错误';
	exit(header('Location:' . ADMIN_URL . '?error_msg=' . $error_msg));
}