<?php
//管理员管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

$action();

function index() {
	$model = new indexPageModel();
	$detail = $model->get_detail_by_id(1);
	$body = base64_decode($detail['data']);

	include (ADMIN_VIEW_PATH . '/manage_front_page/index.html');
}

//保存body中数据
function save_data() {
	$data = $_POST['data'];
	$param['id']		= 1;
	$param['data']	= base64_encode($_POST['data']);
	$model = new indexPageModel();
	$result = $param['id'] ? $model->update($param) : $model->add($param);

	if ($result > 0) {
		exit('success');
	} else {
		exit('fail');
	}
}

function index_edit() {

	include (ADMIN_VIEW_PATH . '/manage_front_page/edit.html');
}

//编辑图片
function edit_img() {
	include (ADMIN_VIEW_PATH . '/manage_front_page/edit_img.html');
}

//提交编辑首页
function commit_edit_index() {
	$content = $_POST['content'];
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