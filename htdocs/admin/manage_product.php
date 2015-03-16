<?php
//产品管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'upload_img_zip';

$action();

//上传压缩文件
function upload_img_zip() {
	include (ADMIN_VIEW_PATH . '/upload_img_zip.html');
}

//开始上传图片压缩包
function commit_upload_img_zip() {
	if (($_FILES["file"]["type"] == "application/x-zip-compressed") && ($_FILES["file"]["size"] < 2000000)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {
			$file_name_arr = explode('.', $_FILES["file"]["name"]);
			$new_file_name = $file_name_arr[0] . '_' . date('YmdHis') . '.' . $file_name_arr[1];
			move_uploaded_file($_FILES["file"]["tmp_name"],
			UPLOAD_PATH . '/product/' . $new_file_name);
		}
	}
	else
	{
		echo "非.zip压缩包文件";
	}
}

//上传产品
function upload_product() {

}

//提交上传产品
function commit_upload_product() {

}

//批量上传产品
function batch_upload_product() {
	$excelModel = new excelModel();
	$excel_list = $excelModel->get_excel_list();
	foreach ($excel_list as $k => $v) {
		$file = explode('_', $v['file']);
		$file_extension = explode('.', $v['file']);
		$excel_list[$k]['origin_file']		= $file[0] . '.' . $file_extension[1];
		$excel_list[$k]['is_in_db']			= $v['state'] == '2' ? '是' : '否';//是否已导入至数据库
		$excel_list[$k]['download_url']	= UPLOAD_URL . '/product/' . $v['file'];
	}
	include (ADMIN_VIEW_PATH . '/batch_upload_product.html');
}

//提交批量上传的产品
function commit_batch_upload_product() {
	if (($_FILES["file"]["type"] == "application/vnd.ms-excel") && ($_FILES["file"]["size"] < 2000000)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {
			$file_name_arr = explode('.', $_FILES["file"]["name"]);
			$new_file_name = $file_name_arr[0] . '_' . date('YmdHis') . '.' . $file_name_arr[1];
			$file_position = UPLOAD_PATH . '/product/' . $new_file_name;
			move_uploaded_file($_FILES["file"]["tmp_name"], $file_position);

			//记录产品
			$excelModel = new excelModel();
			$excelModel->insert_excel($new_file_name);

			//记录日志部分
			$username = $_SESSION['username'];
			$adminModel = new adminModel();
			$admin_detail = $adminModel->get_admin_detail_by_username($username);
			$admin_name = $admin_detail['name'];
			$logModel = new logModel();
			$log['tag'] = 'manage_product';
			$log['content'] = $admin_name . '上传了产品列表文件:' . $file_position;
			$log['level'] = 'info';
// 			pr($log);
			$logModel->log($log);

			batch_upload_product();
		}
	}
	else
	{
		echo "非法文件";
	}
}


//产品列表
function product_list() {
	$productModel = new productModel();
	$param = array();
	$product_list = $productModel->get_product_list($param);
	foreach ($product_list as $k => $v) {
		$product_list[$k]['publish_name'] = $v['is_publish'] == 1 ? '已发布' : '未发布';
	}
	include (ADMIN_VIEW_PATH . '/product_list.html');
}

//编辑产品
function edit_product() {
	$product_id = $_GET['product_id'];
	$productModel = new productModel();
	$product_detail = $productModel->get_product_detail_by_id($product_id);
	include (ADMIN_VIEW_PATH . '/edit_product.html');
}