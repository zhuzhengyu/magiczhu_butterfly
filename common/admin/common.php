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
	$class_name_array[] = 'model';
	$class_name_array[] = 'adminModel';
	$class_name_array[] = 'excelModel';
	$class_name_array[] = 'logModel';
	$class_name_array[] = 'moduleModel';
	$class_name_array[] = 'productModel';
	$class_name_array[] = 'playerModel';
// 	$class_name_array[] = '';
	if (in_array($class_name, $class_name_array)) {
		include (MODEL_PATH . '/' . $class_name . '.php');
	}
}

function pr($var) {
	echo '<pre>';
	print_r($var);
	echo '</pre>';
}