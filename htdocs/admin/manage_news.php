<?php
//管理员管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'admin_list';

$action();

//资讯列表
function news_list() {
	$newsModel = new newsModel();
	$news_list = $newsModel->get_news_list();
}

//编辑资讯
function edit_news() {

}

//提交编辑资讯
function commit_edit_news() {

}