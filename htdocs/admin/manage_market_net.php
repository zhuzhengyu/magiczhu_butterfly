<?php
//营销网络管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'map_list';

$action();

//营销网络地图编辑
function map_list() {
	
}



//营销网络列表
function market_net_list() {
	$gameModel = new gameModel();
	$game_list = $gameModel->get_game_list();
	include (ADMIN_VIEW_PATH . '/game/game_list.html');
}

//编辑营销网络
function edit_game() {
	$game_id = $_GET['game_id'];
	$gameModel = new gameModel();
	$game_detail = $gameModel->get_game_detail_by_id($game_id);
	include (ADMIN_VIEW_PATH . '/game/edit_game.html');
}

//提交编辑营销网络
function commit_edit_game() {
	$param['id']				= $_POST['game_id'];
	$param['no']				= $_POST['no'];
	$param['video_url']	= $_POST['video_url'];
	$param['title']				= $_POST['game_title'];
	$param['content']		= $_POST['game_content'];
	$gameModel = new gameModel();
	// pr($param);
	$result = $param['id'] ? $gameModel->update_game($param) : $gameModel->add_game($param);

	if ($result == true) {
		$username = $_SESSION['username'];
		$adminModel = new adminModel();
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_game';
		$log['content'] = $admin_name . '编辑营销网络信息|' . json_encode($param);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
	exit;
}
