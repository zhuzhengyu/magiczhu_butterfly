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
	$class_name_array[] = 'newsModel';
	$class_name_array[] = 'gameModel';
	$class_name_array[] = 'marketMapModel';
	$class_name_array[] = 'marketAreaModel';
	$class_name_array[] = 'marketCompanyModel';
	$class_name_array[] = 'marketCompanyClassModel';
	$class_name_array[] = 'indexPageModel';
	$class_name_array[] = 'productClassModel';
	$class_name_array[] = 'validateCodeModel';
	$class_name_array[] = 'productChengPinPaiModel';
	$class_name_array[] = 'productFuZhuangModel';
	$class_name_array[] = 'productFuJianModel';
	$class_name_array[] = 'productPingPangQiuTaiModel';
	$class_name_array[] = 'productQiuPaiModel';
	$class_name_array[] = 'productTaoJiaoModel';
	$class_name_array[] = 'productYunDongBaoModel';
	$class_name_array[] = 'productYunDongXieModel';

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