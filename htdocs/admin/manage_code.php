<?php
//编码管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'class_list';

$action();

//类别列表
function product_class_list() {
	$model = new productClassModel();
	$list = $model->get_list();
	include (ADMIN_VIEW_PATH . '/manage_code/product_class_list.html');
}

//存货编码导入
function product_code_input() {
	if (($_FILES["file"]["type"] == "application/vnd.ms-excel") && ($_FILES["file"]["size"] < 2000000)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {
			
		}
	}
	pr($_FILES);
	exit;
	include LIB_PATH . '/PHPExcel/Classes/PHPExcel/IOFactory.php';
	// 	include LIB_PATH . '/PHPExcel/Classes/PHPExcel.php';
	$objPHPExcel = PHPExcel_IOFactory::load($real_file);
	$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
	$keys = $sheetData[1];
	unset($sheetData[1]);
	foreach ($sheetData as $k => $v) {
		$param[$k]['no']			= $v['A'];
		$param[$k]['name']		= $v['B'];
		$param[$k]['price']		= $v['C'];
		$param[$k]['category']	= $v['D'];
	}
}

//防伪码列表
function validate_code_list() {
	
}

//防伪码导入
function validate_code_input() {
	
}

