<?php
/**
 * @method 检测后台登录状态
 * @param void
 * @return void
 */
function checkAdminLogin() {
	session_start();
	if ($_SESSION['admin_login'] != true) {
		exit(header('Location:' . ADMIN_URL));
	}
}

//php模块自动加载方式
function __autoload($class_name) {
	include (MODEL_PATH . '/' . $class_name . '.php');
}

function pr($var) {
	echo '<pre>';
	print_r($var);
	echo '</pre>';
}