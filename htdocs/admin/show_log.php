<?php
//管理员管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'admin_list';

$action();

//管理员管理相关日志
function manage_admin() {
	$logModel = new logModel();
	$log_list = $logModel->get_log_by_tag('manage_admin');
	include (ADMIN_VIEW_PATH . '/show_log.html');
}