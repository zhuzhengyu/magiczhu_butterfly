<?php
//管理员管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'admin_list';

$action();

//球员列表
function player_list() {
	$playerModel = new playerModel();
	$player_list = $playerModel->get_player_list($param);
	foreach ($player_list as $k => $v) {
		$player_list[$k]['delete_name'] = $v['is_delete'] == 1 ? '未启用' : '启用';
	}
// 	pr($player_list);
	include (ADMIN_VIEW_PATH . '/manage_player.html');
}

//编辑球员
function edit_player() {
	$player_id = $_GET['player_id'];
	$playerModel = new playerModel();
	$player_detail = $playerModel->get_player_detail_by_id($player_id);
	$achievement_arr = explode('|', $player_detail['achievement']);
	unset($player_detail['achievement']);
	foreach ($achievement_arr as $k => $v) {
		$temp = explode(':', $v);
		$player_detail['achievement_year'][$k]	= $temp[0];
		$player_detail['achievement'][$k]				= $temp[1];
	}
	include (ADMIN_VIEW_PATH . '/edit_player.html');
}

//提交编辑球员
function commit_edit_player() {
	$param['player_id']		= $_POST['player_id'];
	$param['name']				= $_POST['name'];
	$param['nationality']		= $_POST['nationality'];
	$param['birth']				= $_POST['birth'];
	$param['zhan_xing']		= $_POST['zhan_xing'];
	$achievement = $_POST['achievement'];
	$achievement_year = $_POST['achievement_year'];

	foreach($achievement as $k => $v) {
		$arr[$k] = $achievement_year[$k] . ':' . $v;
	}
	$param['achievement'] = implode('|', $arr);
	$playerModel = new playerModel();
	$result = $param['player_id'] ? $playerModel->update_player($param) : $playerModel->add_player($param);

	if ($result == true) {
		$username = $_SESSION['username'];
		$adminModel = new adminModel();
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_player';
		$log['content'] = $admin_name . '编辑球员信息|' . json_encode($param);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
}