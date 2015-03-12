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
		if ($_FILES["file"]["error"] > 0)
		{
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		}
		else
		{
// 			echo "Upload: " . $_FILES["file"]["name"] . "<br />";
// 			echo "Type: " . $_FILES["file"]["type"] . "<br />";
// 			echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";
// 			echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";
			$new_file_name = $_FILES["file"]["name"] . '_' . date('YmdHis');
// 			if (file_exists("upload/" . $_FILES["file"]["name"]))
// 			{
// 				echo $_FILES["file"]["name"] . " already exists. ";
// 			}
// 			else
// 			{
				move_uploaded_file($_FILES["file"]["tmp_name"],
				"upload/" . $_FILES["file"]["name"]);
				echo "Stored in: " . "upload/" . $_FILES["file"]["name"];
// 			}
		}
	}
	else
	{
		echo "Invalid file";
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
	include (ADMIN_VIEW_PATH . '/batch_upload_product.html');
}

//提交批量上传的产品
function commit_batch_upload_product() {

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