<?php
//管理员管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'admin_list';

$action();

/**
 * @method 获取管理员列表
 */
function admin_list() {
	$adminModel = new adminModel();
	$admin_list = $adminModel->get_all_admin();
	$moduleModel = new moduleModel();
	$parent_module_list  = $moduleModel->get_parent_module_list();

	foreach ($admin_list as $k => $v) {
		$power_arr = explode(',', $v['power']);
		$module_name_arr = array();
		foreach ($power_arr as $kk => $vv) $module_name_arr[] = $parent_module_list[$vv]['module_name'];
		$admin_list[$k]['delete_name'] = $v['is_delete'] == 1 ? '未启用' : '启用';
		$admin_list[$k]['module_name'] = implode(',', $module_name_arr);
	}

	include (ADMIN_VIEW_PATH . '/manage_admin.html');
}

function edit_admin() {
	$admin_id = isset($_GET['admin_id']) ? $_GET['admin_id'] : '';
	$moduleModel = new moduleModel();
	$parent_module_list  = $moduleModel->get_parent_module_list();
	$adminModel = new adminModel();
	$admin_detail = array();
	if ($admin_id) {
		$admin_detail = $adminModel->get_admin_detail_by_id($admin_id);
		$power_arr = explode(',', $admin_detail['power']);
		foreach ($parent_module_list as $k => $v) {
			foreach ($power_arr as $kk => $vv) {
				if ($k == $vv) $parent_module_list[$k]['is_check'] = true;
			}
		}
	}
// 	pr($parent_module_list);
	include (ADMIN_VIEW_PATH . '/edit_admin.html');
}

//ajax异步调用
function commit_edit_admin() {
	$param['id'] = $_POST['admin_id'];
	$param['username'] = $_POST['username'];
	$param['password'] = $_POST['password'];
	$param['name'] = $_POST['name'];
	$module_id = $_POST['module_id'];
	$param['power'] = implode(',', $module_id);

	$adminModel = new adminModel();
	$result = $param['id'] ? $adminModel->update_admin($param) : $adminModel->add_admin($param);

	if ($result == true) {
		$username = $_SESSION['username'];
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_admin';
		$log['content'] = $admin_name . '编辑管理员信息|' . json_encode($param);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
}