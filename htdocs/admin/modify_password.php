<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'modify_password';

$action();

//修改密码
function modify_password() {
	include (ADMIN_VIEW_PATH . '/modify_password.html');
}

//提交修改密码
function commit_modify_password() {
	$param['old_password']		= $_POST['old_password'];
	$param['new_password']		= $_POST['new_password'];
	session_start();
	$param['username']				= $_SESSION['username'];
	$adminModel = new adminModel();
	$result = $adminModel->modify_password($param);
	header("Content-type: text/html; charset=utf-8");
	if ($result) {
		exit("<script>alert('修改成功,请重新登录!');window.location.href='" . ADMIN_URL . "'</script>");
	} else {
		exit("<script>alert('修改失败,请重新输入!');window.history.back();</script>");
	}
}