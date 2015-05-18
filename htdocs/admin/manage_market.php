<?php
//营销网络管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'map_list';

$action();

//公司列表
function company_list() {
	$model = new marketCompanyModel();
	$company_list = $model->get_list();
	include (ADMIN_VIEW_PATH . '/market/company_list.html');
}

//编辑公司名
function edit_company() {
	$model = new marketCompanyModel();
	$detail = $model->get_detail_by_id($_GET['company_id']);
	
	$areaModel = new marketAreaModel();
	$area_list = $areaModel->get_list();
	
	include (ADMIN_VIEW_PATH . '/market/edit_company.html');
}

//提交编辑公司
function commit_edit_company() {
	$param['id']						= $_POST['company_id'];
	$param['company_name']	= $_POST['company_name'];
	$param['address']				= $_POST['address'];
	$param['phone']				= $_POST['phone'];
	$param['fax_number']		= $_POST['fax_number'];
	$param['area_id']				= $_POST['area'];
	
	$marketAreaModel = new marketAreaModel();
	$area_sort = $marketAreaModel->get_area_sort();
	$param['area_name']			= $area_sort[$_POST['area']];

	$marketCompanyModel = new marketCompanyModel();
	$result = $param['id'] ? $marketCompanyModel->update($param) : $marketCompanyModel->add($param);
	
	if ($result > 0) {
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