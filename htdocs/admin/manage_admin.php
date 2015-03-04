<?php
//管理员管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
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

function add_admin() {

}

function commit_add_admin() {

}

function edit_admin() {
	$admin_id = isset($_GET['admin_id']) ? $_GET['admin_id'] : '';
	$moduleModel = new moduleModel();
	$parent_module_list  = $moduleModel->get_parent_module_list();
	$adminModel = new adminModel();
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

function commit_edit_admin() {

}