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
	$param['img']					= $_POST['img'];
	
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

//经销商分类
function company_class_list() {
	$model = new marketCompanyClassModel();
	$company_class_list = $model->get_list();
	include (ADMIN_VIEW_PATH . '/market/company_class_list.html');
}

//编辑经销商类别
function edit_company_class() {
	$model = new marketCompanyClassModel();
	$detail = $model->get_detail_by_id($_GET['company_class_id']);
	
	$checked_company_arr = explode('|', $detail['company_id_list']);
	$companyModel = new marketCompanyModel();
	$company_list = $companyModel->get_list();
	
	foreach ($checked_company_arr as $v) {
		foreach ($company_list as $kk => $vv) {
			if ($v == $vv['id']) $company_list[$kk]['checked_company'] = true;
		}
	}
	
	include (ADMIN_VIEW_PATH . '/market/edit_company_class.html');
}

//提交编辑经销商类别
function commit_edit_company_class() {
	$param['id']						= $_POST['company_class_id'];
	$param['company_id_list']	= implode('|', $_POST['company_id']);
	$param['class_name']		= $_POST['company_class_name'];
	$model = new marketCompanyClassModel();
	$result = $param['id'] ? $model->update($param) : $model->add($param);	
	
	if ($result == true) {
		$username = $_SESSION['username'];
		$adminModel = new adminModel();
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_player';
		$log['content'] = $admin_name . '编辑经销商类别信息|' . json_encode($param);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
}

//异步提交图片
function upload_img_ajax() {
	$action = isset($_GET['act']) ? $_GET['act'] : '';
	if($action=='delimg'){
		$filename = $_POST['imagename'];
		if(!empty($filename)){
			unlink('files/'.$filename);
			echo '1';
		}else{
			echo '删除失败.';
		}
	}else{
		$picname = $_FILES['mypic']['name'];
		$picsize = $_FILES['mypic']['size'];
		if ($picname != "") {
			if ($picsize > 1024000) {
				echo '图片大小不能超过1M';
				exit;
			}
			$type = strstr($picname, '.');
			if ($type != ".gif" && $type != ".jpg") {
				echo '图片格式不对！';
				exit;
			}
			$rand = rand(100, 999);
			$pics = date("YmdHis") . $rand . $type;
			//上传路径
			$pic_path = UPLOAD_PATH . "/files/". $pics;
			move_uploaded_file($_FILES['mypic']['tmp_name'], $pic_path);
		}
		$size = round($picsize/1024,2);
		$arr = array(
				'name'=>$picname,
				'pic'=>$pics,
				'size'=>$size
		);
		echo json_encode($arr);
	}
}