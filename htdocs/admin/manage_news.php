<?php
//资讯管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'news_list';

$action();

//资讯列表
function news_list() {
	$newsModel = new newsModel();
	$news_list = $newsModel->get_news_list();
	include (ADMIN_VIEW_PATH . '/news/news_list.html');
}

//编辑资讯
function edit_news() {
	$news_id = $_GET['news_id'];
	$newsModel = new newsModel();
	$news_detail = $newsModel->get_news_detail_by_id($news_id);
	include (ADMIN_VIEW_PATH . '/news/edit_news.html');
}

//提交编辑资讯
function commit_edit_news() {
	$param['id']				= $_POST['news_id'];
// 	$param['no']				= $_POST['no'];
// 	$param['video_url']	= $_POST['video_url'];
	$param['title']				= $_POST['news_title'];
	$param['content']		= $_POST['news_content'];
	$param['img']				= $_POST['img'];
	$newsModel = new newsModel();
// pr($param);
	$result = $param['id'] ? $newsModel->update_news($param) : $newsModel->add_news($param);

	if ($result == true) {
		$username = $_SESSION['username'];
		$adminModel = new adminModel();
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_news';
		$log['content'] = $admin_name . '编辑资讯信息|' . json_encode($param);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
exit;
	$param['player_id']		= $_POST['player_id'];
	$param['name']				= $_POST['name'];
	$param['nationality']		= $_POST['nationality'];
	$param['birth']				= $_POST['birth'];
	$param['zhan_xing']		= $_POST['zhan_xing'];
	$achievement = $_POST['achievement'];
	$achievement_year = $_POST['achievement_year'];

	foreach($achievement as $k => $v) {
		if (!($achievement_year[$k]) || !($v)) continue;
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
