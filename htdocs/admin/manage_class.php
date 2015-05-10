<?php
//产品管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'class_list';

$action();

//类别列表
function class_list() {
	$classModel = new classModel();
	$firstClass = $classModel->get_first_class_list();//获取大类列表

}


//上传压缩文件
function upload_img_zip() {
	include (ADMIN_VIEW_PATH . '/upload_img_zip.html');
}