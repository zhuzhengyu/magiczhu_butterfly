<?php
//编码管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'product_class_list';

$action();

//类别列表
function product_class_list() {
	$model = new productClassModel();
	$list = $model->get_list();
	include (ADMIN_VIEW_PATH . '/manage_code/product_class_list.html');
}

//存货编码导入
function product_code_input() {
	set_time_limit(180) ;
	if (($_FILES["file"]["type"] == "application/vnd.ms-excel") && ($_FILES["file"]["size"] < 2000000)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {

		}
	}
	include LIB_PATH . '/PHPExcel/Classes/PHPExcel/IOFactory.php';
	$objReader = PHPExcel_IOFactory::createReader('Excel5');
	$objReader->setIncludeCharts(TRUE);
	$objPHPExcel = $objReader->load($_FILES['file']['tmp_name']);
// 	foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
// 		$sheetName = $worksheet->getTitle();
// 		pr($sheetName);
// 	}

	$productClassModel = new productClassModel();
	$productModel = new productModel();
	$countSheets = $objPHPExcel->getSheetCount();
	for ($i = 0; $i < $countSheets; ++$i) {
		$phpSheet = $objPHPExcel->getSheet($i);
		$title = $phpSheet->getTitle();
		$class_id = $productClassModel->get_id_by_class_name($title);
		if (!$class_id) {
			$param1['class_name'] = $title;
			$class_id = $productClassModel->add($param1);
		}
		$sheetData = $phpSheet->toArray(null,true,true,true);
		unset($sheetData[1]);
		foreach ($sheetData as $k => $v) {
			$param = array();
			$param['class_id'] = $class_id;
			$param['no']		= $v['B'];
			$param['name']	= $v['C'];
			$productModel->add($param);
		}
	}

	header("Content-type: text/html; charset=utf-8");
	exit('<script>alert("导入成功!");</script>');
}

//防伪码列表
function validate_code_list() {
	$model = new validateCodeModel();
	$list = $model->get_list();
	include (ADMIN_VIEW_PATH . '/manage_code/validate_code_list.html');
}

//防伪码导入
function validate_code_input() {

}

