<?php
//产品管理
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态
$action = isset($_GET['action']) ? $_GET['action'] : 'upload_img_zip';

$action();

//上传压缩文件
function upload_img_zip() {
	$param['page_no'] = isset($_GET['page_no']) ? $_GET['page_no'] : '1';
	$param['per_page'] = isset($_GET['per_page']) ? $_GET['per_page'] : '10';

	$model = new imgZipModel();
	$list = $model->get_list();
	foreach ($list as $k => $v) {
		$file = explode('_', $v['file']);
		$file_extension = explode('.', $v['file']);
		$list[$k]['origin_file']		= $file[0] . '.' . $file_extension[1];
		$list[$k]['is_in_db']			= $v['state'] == '2' ? '是' : '否';//是否已导入至数据库
		$list[$k]['download_url']	= UPLOAD_URL . '/img_zip/' . $v['file'];
	}
	include (ADMIN_VIEW_PATH . '/manage_product/upload_img_zip.html');
}

//开始上传图片压缩包
function commit_upload_img_zip() {
	if (($_FILES["file"]["type"] == "application/x-zip-compressed") && ($_FILES["file"]["size"] < 2000000)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {
// 			$file_name_arr = explode('.', $_FILES["file"]["name"]);
// 			$new_file_name = $file_name_arr[0] . '_' . date('YmdHis') . '.' . $file_name_arr[1];
// 			move_uploaded_file($_FILES["file"]["tmp_name"], UPLOAD_PATH . '/product/' . $new_file_name);
			$file_name_arr = explode('.', $_FILES["file"]["name"]);
			$new_file_name = $file_name_arr[0] . '_' . date('YmdHis') . '.' . $file_name_arr[1];
			$file_position = UPLOAD_PATH . '/img_zip/' . $new_file_name;
			move_uploaded_file($_FILES["file"]["tmp_name"], $file_position);

			$data['file'] = $new_file_name;
			$data['create_date'] = date('Y-m-d H:i:s');
			//记录产品
			$excelModel = new imgZipModel();
			$excelModel->add($data);
		}
	}
	else
	{
		echo "非.zip压缩包文件";
	}
}

//上传产品
function upload_product() {

}

//提交上传产品
function commit_upload_product() {

}

//批量上传产品
function batch_upload_product() {
	$param['page_no'] = isset($_GET['page_no']) ? $_GET['page_no'] : '1';
	$param['per_page'] = isset($_GET['per_page']) ? $_GET['per_page'] : '10';
	$excelModel = new excelModel();
	$excel_list = $excelModel->get_excel_list($param, $total_page);
	foreach ($excel_list as $k => $v) {
		$file = explode('_', $v['file']);
		$file_extension = explode('.', $v['file']);
		$excel_list[$k]['origin_file']		= $file[0] . '.' . $file_extension[1];
		$excel_list[$k]['is_in_db']			= $v['state'] == '2' ? '是' : '否';//是否已导入至数据库
		$excel_list[$k]['download_url']	= UPLOAD_URL . '/product/' . $v['file'];
	}
	include (ADMIN_VIEW_PATH . '/batch_upload_product.html');
}

//提交批量上传的产品
function commit_batch_upload_product() {
	set_time_limit(600);
// 	pr($_FILES);
	if (($_FILES["file"]["type"] == "application/vnd.ms-excel" || $_FILES["file"]["type"] == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') && ($_FILES["file"]["size"] < 1024 * 100)) {
		if ($_FILES["file"]["error"] > 0) {
			exit('上传出现错误');
			$_FILES["file"]["error"];//获取错误码
		} else {
			$file_name_arr = explode('.', $_FILES["file"]["name"]);
			$new_file_name = $file_name_arr[0] . '_' . date('YmdHis') . '.' . $file_name_arr[1];
			$file_position = UPLOAD_PATH . '/product/' . $new_file_name;
			move_uploaded_file($_FILES["file"]["tmp_name"], $file_position);

			//记录产品
			$excelModel = new excelModel();
			$excelModel->insert_excel($new_file_name);

			//记录日志部分
			$username = $_SESSION['username'];
			$adminModel = new adminModel();
			$admin_detail = $adminModel->get_admin_detail_by_username($username);
			$admin_name = $admin_detail['name'];
			$logModel = new logModel();
			$log['tag'] = 'manage_product';
			$log['content'] = $admin_name . '上传了产品列表文件:' . $file_position;
			$log['level'] = 'info';
// 			pr($log);
			$logModel->log($log);

			batch_upload_product();
		}
	}
	else
	{
		echo "非法文件";
	}
}

//将图片解压至文件中
function load_img_zip_to_file() {
	$img_zip_id = $_GET['img_zip_id'];
	$model = new imgZipModel();
	$file = $model->get_detail_by_id($img_zip_id);
	$real_zip = UPLOAD_PATH . '/img_zip/' . $file['file'];
	$zip = zip_open($real_zip);

	if ($zip) {
		while ($zip_entry = zip_read($zip)) {
			$temp_img = UPLOAD_PATH . '/img/' . zip_entry_name($zip_entry);
			if (zip_entry_open($zip, $zip_entry, "r")) //打开 ZIP 文件中的一个项目以供读取
			{
				$content = zip_entry_read($zip_entry,zip_entry_filesize($zip_entry));//读取 ZIP 文件中的一个打开的项目
				if($fp = fopen($temp_img,'w'))  //打开创建一个写入文件
				{
					if(fwrite($fp,$content)) //写入文件
					{
						fclose($fp);        //关闭文件
					}
				}
			};
			zip_entry_close($zip_entry); //关闭zip中打开的项目
		}
		zip_close($zip);
		$model->update(array('id' => $img_zip_id, 'state' => 2));
		exit('<script>alert("导入成功!");window.history.go(-1);</script>');
	}
	exit('<script>alert("导入失败!");</script>');
}

//将指定excel导入至数据库
function load_excel_to_db() {
	$excel_id = $_GET['excel_id'];
	$excelModel = new excelModel();
	$file = $excelModel->get_file_by_id($excel_id);
	if ($file) {
		$real_file = UPLOAD_PATH . '/product/' . $file;
		include LIB_PATH . '/PHPExcel/Classes/PHPExcel/IOFactory.php';
	// 	include LIB_PATH . '/PHPExcel/Classes/PHPExcel.php';
		$objPHPExcel = PHPExcel_IOFactory::load($real_file);
		$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
		$type = get_excel($sheetData[1]);

		$function_pre = 'load_';
		$function['成品拍']		= 'cheng_pin_pai';
		$function['服装']			= 'fu_zhuang';
		$function['附件']			= 'fu_jian';
		$function['乒乓球台']		= 'ping_pang_qiu_tai';
		$function['球拍']			= 'qiu_pai';
		$function['套胶']			= 'tao_jiao';
		$function['运动包']		= 'yun_dong_bao';
		$function['运动鞋']		= 'yun_dong_xie';
		unset($sheetData[1]);
		if ($sheetData && is_array($sheetData)) {
			$real_function = $function_pre . $function[$type];
			$real_function($sheetData);
			$productModel = new productModel();
			foreach ($sheetData as $k => $v) {
				$productParam['no']							= $v['A'];
				$productParam['name']					= $v['B'];
				$productParam['category_name']	= $function[$type];
				$productModel->add($productParam);
			}
			$excelModel->update(array('id' => $excel_id, 'state' => 2));
			exit('<script>alert("导入成功!");window.history.go(-1);</script>');
		}
		exit('<script>alert("导入失败!");</script>');
	}
}

//产品列表
function product_list() {
	$productModel = new productModel();
	$param = array();
	$product_list = $productModel->get_product_list($param);
// 	pr($product_list);
	foreach ($product_list as $k => $v) {
		$product_list[$k]['publish_name'] = $v['is_publish'] == 1 ? '已发布' : '未发布';
	}
	include (ADMIN_VIEW_PATH . '/manage_product/product_list.html');
}

//编辑产品
function edit_product() {
	$product_id = $_GET['product_id'];
	if ($product_id) {
		$productModel = new productModel();
// 		$product_detail = $productModel->get_product_detail_by_id($product_id);
		$product_detail = $productModel->get_detail_by_id($product_id);

		$product_model_list['cheng_pin_pai']		= 'productChengPinPaiModel';
		$product_model_list['fu_zhuang']				= 'productFuZhuangModel';
		$product_model_list['fu_jian']					= 'productFuJianModel';
		$product_model_list['ping_pang_qiu_tai']	= 'productPingPangQiuTaiModel';
		$product_model_list['qiu_pai']					= 'productQiuPaiModel';
		$product_model_list['tao_jiao']					= 'productTaoJiaoModel';
		$product_model_list['yun_dong_bao']		= 'productYunDongBaoModel';
		$product_model_list['yun_dong_xie']			= 'productYunDongXieModel';
		$model_name = $product_model_list[$product_detail['category_name']];
		$model = new $model_name();
		$real_detail = $model->get_detail_by_condition(array('no' => $product_detail['no']));

		$first_detail_id = $product_detail['id'];
		$second_detail_id = $real_detail['id'];
		$category_name = $product_detail['category_name'];
		unset($real_detail['id'], $real_detail['create_date'], $real_detail['update_date'], $real_detail['is_delete']);
		$show_detail = change_array($real_detail);
// 		pr($show_detail);
// 		pr($product_detail);
// 		pr($real_detail);
	}
	include (ADMIN_VIEW_PATH . '/manage_product/edit_product.html');
}

//提交编辑产品
function commit_edit_product() {
	$first_product['id']		= $_POST['first_detail_id'];
	$first_product['name']	= $_POST['name'];

	$productModel = new productModel();
	$result = $first_product['id'] ? $productModel->update($first_product) : $productModel->add($first_product);
	$data				= $_POST;
	$data['id']			= $_POST['second_detail_id'];
	unset($data['first_detail_id'], $data['second_detail_id'], $data['category_name']);
	$product_model_list['cheng_pin_pai']		= 'productChengPinPaiModel';
	$product_model_list['fu_zhuang']				= 'productFuZhuangModel';
	$product_model_list['fu_jian']					= 'productFuJianModel';
	$product_model_list['ping_pang_qiu_tai']	= 'productPingPangQiuTaiModel';
	$product_model_list['qiu_pai']					= 'productQiuPaiModel';
	$product_model_list['tao_jiao']					= 'productTaoJiaoModel';
	$product_model_list['yun_dong_bao']		= 'productYunDongBaoModel';
	$product_model_list['yun_dong_xie']			= 'productYunDongXieModel';
	$model_name = $product_model_list[$_POST['category_name']];
	$model = new $model_name();
	$result2 = $data['id'] ? $model->update($data) : $model->add($data);
// 	$product['no']			= $_POST['no'];
// 	$product['id']			= $_POST['product_id'];
// 	$product['name']		= $_POST['name'];
// 	$product['price']		= $_POST['price'];
// 	$product['category']	= $_POST['category'];
// 	$result = $product['id'] ? $productModel->update_product($product) : $productModel->add_product($product);

	if ($result2 == true) {
		$username = $_SESSION['username'];
		$adminModel = new adminModel();
		$admin_detail = $adminModel->get_admin_detail_by_username($username);
		$admin_name = $admin_detail['name'];
		$logModel = new logModel();
		$log['tag'] = 'manage_product';
		$log['content'] = $admin_name . '编辑产品信息|' . json_encode($data);
		$log['level'] = 'info';
		$logModel->log($log);
		exit('success');
	} else {
		exit('fail');
	}
}

//将成品拍数据写入DB
function load_cheng_pin_pai($data) {
	$model = new productChengPinPaiModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']							= $v['A'];
		$param['name']						= $v['B'];
		$param['c_short_name']		= $v['C'];
		$param['e_short_name']		= $v['D'];
		$param['da_fa_lei_bie']			= $v['E'];
		$param['hai_mian_hou_du']	= $v['F'];
		$param['he_ban_zhong_lei']	= $v['G'];
		$param['mu_cai']					= $v['H'];
		$param['mian_ban_cai_zhi']	= $v['I'];
		$param['chan_di']					= $v['J'];
		$param['price']						= $v['K'];
		$param['zi_lei_bie']				= $v['L'];
		$model->add($param);
	}
}

//将服装数据写入DB
function load_fu_zhuang($data) {
	$model = new productFuZhuangModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']						= $v['A'];
		$param['name']					= $v['B'];
		$param['c_short_name']	= $v['C'];
		$param['e_short_name']	= $v['D'];
		$param['color']					= $v['E'];
		$param['size']						= $v['F'];
		$param['mian_liao']			= $v['G'];
		$param['te_xing_1']			= $v['H'];
		$param['te_xing_2']			= $v['I'];
		$param['te_xing_3']			= $v['J'];
		$param['chan_di']				= $v['K'];
		$param['price']					= $v['L'];
		$param['zi_lei_bie']			= $v['M'];
		$model->add($param);
	}
}

//将附件数据写入DB
function load_fu_jian($data) {
	$model = new productFuJianModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']						= $v['A'];
		$param['name']					= $v['B'];
		$param['c_short_name']	= $v['C'];
		$param['e_short_name']	= $v['D'];
		$param['size']						= $v['E'];
		$param['mian_liao']			= $v['F'];
		$param['te_xing_1']			= $v['G'];
		$param['te_xing_2']			= $v['H'];
		$param['te_xing_3']			= $v['I'];
		$param['chan_di']				= $v['J'];
		$param['price']					= $v['K'];
		$param['zi_lei_bie']			= $v['L'];
		$model->add($param);
	}
}

//将乒乓球台数据写入DB
function load_ping_pang_qiu_tai($data) {
	$model = new productPingPangQiuTaiModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']						= $v['A'];
		$param['name']					= $v['B'];
		$param['c_short_name']	= $v['C'];
		$param['e_short_name']	= $v['D'];
		$param['kuan_shi']			= $v['E'];
		$param['mian_ban_hou_du']	= $v['F'];
		$param['mian_ban_cai_zhi']		= $v['G'];
		$param['weight']				= $v['H'];
		$param['zhuo_jiao']			= $v['I'];
		$param['jiao_jie_mian']		= $v['J'];
		$param['te_xing']				= $v['K'];
		$param['chan_di']				= $v['L'];
		$param['price']					= $v['M'];
		$param['zi_lei_bie']			= $v['N'];
		$model->add($param);
	}
}

//将球拍数据写入DB
function load_qiu_pai($data) {
	$model = new productQiuPaiModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']							= $v['A'];
		$param['name']						= $v['B'];
		$param['c_short_name']		= $v['C'];
		$param['e_short_name']		= $v['D'];
		$param['da_fa_lei_bie']			= $v['E'];
		$param['fan_tan_te_xing']		= $v['F'];
		$param['zhen_dong_te_xing']	= $v['G'];
		$param['qiu_pai_su_cai']		= $v['H'];
		$param['ban_bing_xing_zhuang']	= $v['I'];
		$param['ban_mian_xing_zhuang']	= $v['J'];
		$param['he_ban_zhong_lei']	= $v['K'];
		$param['te_xing']					= $v['L'];
		$param['qiu_pai_hou_du']		= $v['M'];
		$param['qiu_pai_zhong_lei']	= $v['N'];
		$param['ban_mian_chi_cun']	= $v['O'];
		$param['shou_bing_chi_cun']	= $v['P'];
		$param['chan_di']					= $v['Q'];
		$param['price']						= $v['R'];
		$param['zi_lei_bie']				= $v['S'];
		$model->add($param);
	}
}

//将套胶写入DB
function load_tao_jiao($data) {
	$model = new productTaoJiaoModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']							= $v['A'];
		$param['name']						= $v['B'];
		$param['c_short_name']		= $v['C'];
		$param['e_short_name']		= $v['D'];
		$param['tao_jiao_zhong_lei']= $v['E'];
		$param['tao_jiao_yan_se']		= $v['F'];
		$param['hai_mian_hou_du']	= $v['G'];
		$param['tao_jiao_su_du']		= $v['H'];
		$param['tao_jiao_xuan_zhuang']	= $v['I'];
		$param['tao_jiao_xuan_zhuan']	= $v['J'];
		$param['tao_jiao_te_xing']		= $v['K'];
		$param['tao_jiao_ying_du']	= $v['L'];
		$param['chan_di']					= $v['M'];
		$param['price']						= $v['N'];
		$param['zi_lei_bie']				= $v['O'];
		$model->add($param);
	}
}

//将运动包数据写入DB
function load_yun_dong_bao($data) {
	$model = new productYunDongBaoModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']							= $v['A'];
		$param['name']						= $v['B'];
		$param['c_short_name']		= $v['C'];
		$param['e_short_name']		= $v['D'];
		$param['color']						= $v['E'];
		$param['size']						= $v['F'];
		$param['mian_liao']				= $v['G'];
		$param['te_xing_1']				= $v['H'];
		$param['te_xing_2']				= $v['I'];
		$param['te_xing_3']				= $v['J'];
		$param['chan_di']					= $v['K'];
		$param['price']						= $v['L'];
		$param['zi_lei_bie']				= $v['M'];
		$model->add($param);
	}
}

//将运动鞋数据写入DB
function load_yun_dong_xie($data) {
	$model = new productYunDongXieModel();
	foreach ($data as $k => $v) {
		$param = array();
		$param['no']							= $v['A'];
		$param['name']						= $v['B'];
		$param['c_short_name']		= $v['C'];
		$param['e_short_name']		= $v['D'];
		$param['color']						= $v['E'];
		$param['size']							= $v['F'];
		$param['cai_zhi']					= $v['G'];
		$param['te_xing_1']				= $v['H'];
		$param['te_xing_2']				= $v['I'];
		$param['te_xing_3']				= $v['J'];
		$param['chan_di']					= $v['K'];
		$param['price']						= $v['L'];
		$param['zi_lei_bie']				= $v['M'];
		$model->add($param);
	}
}

//识别属于哪个产品类型
function get_excel($data) {
	//成品拍
	$type['成品拍']['A'] = '存货编码';
	$type['成品拍']['B'] = '品名';
	$type['成品拍']['C'] = '中文简称';
	$type['成品拍']['D'] = '字母简称';
	$type['成品拍']['E'] = '打法类别';
	$type['成品拍']['F'] = '海绵厚度';
	$type['成品拍']['G'] = '合板种类';
	$type['成品拍']['H'] = '木材';
	$type['成品拍']['I'] = '面板材质';
	$type['成品拍']['J'] = '产地';
	$type['成品拍']['K'] = '零售价';
	$type['成品拍']['L']	= '子类别';
	//服装
	$type['服装']['A'] = '存货编码';
	$type['服装']['B'] = '品名';
	$type['服装']['C'] = '中文简称';
	$type['服装']['D'] = '字母简称';
	$type['服装']['E'] = '颜色';
	$type['服装']['F'] = '尺寸';
	$type['服装']['G'] = '面料';
	$type['服装']['H'] = '特性1';
	$type['服装']['I'] = '特性2';
	$type['服装']['J'] = '特性3';
	$type['服装']['K'] = '产地';
	$type['服装']['L'] = '零售价';
	$type['服装']['M']	= '子类别';
	//附件
	$type['附件']['A'] = '存货编码';
	$type['附件']['B'] = '品名';
	$type['附件']['C'] = '中文简称';
	$type['附件']['D'] = '字母简称';
	$type['附件']['E'] = '尺寸';
	$type['附件']['F'] = '面料';
	$type['附件']['G'] = '特性1';
	$type['附件']['H'] = '特性2';
	$type['附件']['I'] = '特性3';
	$type['附件']['J'] = '产地';
	$type['附件']['K'] = '零售价';
	$type['附件']['L']	= '子类别';
	//乒乓球台
	$type['乒乓球台']['A'] = '存货编码';
	$type['乒乓球台']['B'] = '品名';
	$type['乒乓球台']['C'] = '中文简称';
	$type['乒乓球台']['D'] = '字母简称';
	$type['乒乓球台']['E'] = '款式';
	$type['乒乓球台']['F'] = '面板厚度';
	$type['乒乓球台']['G'] = '面板材质';
	$type['乒乓球台']['H'] = '重量';
	$type['乒乓球台']['I'] = '桌脚';
	$type['乒乓球台']['J'] = '脚截面';
	$type['乒乓球台']['K'] = '特性';
	$type['乒乓球台']['L'] = '产地';
	$type['乒乓球台']['M'] = '零售价';
	$type['乒乓球台']['N']	= '子类别';
	//球拍
	$type['球拍']['A'] = '存货编码';
	$type['球拍']['B'] = '品名';
	$type['球拍']['C'] = '中文简称';
	$type['球拍']['D'] = '字母简称';
	$type['球拍']['E'] = '打法类别';
	$type['球拍']['F'] = '反弹特性';
	$type['球拍']['G'] = '震动特性';
	$type['球拍']['H'] = '球拍素材';
	$type['球拍']['I'] = '板柄形状';
	$type['球拍']['J'] = '版面形状';
	$type['球拍']['K'] = '合板种类';
	$type['球拍']['L'] = '特性';
	$type['球拍']['M'] = '球拍厚度';
	$type['球拍']['N'] = '球拍种类';
	$type['球拍']['O'] = '版面尺寸';
	$type['球拍']['P'] = '手柄尺寸';
	$type['球拍']['Q'] = '产地';
	$type['球拍']['R'] = '零售价';
	$type['球拍']['S']	= '子类别';
	//套胶
	$type['套胶']['A'] = '存货编码';
	$type['套胶']['B'] = '品名';
	$type['套胶']['C'] = '中文简称';
	$type['套胶']['D'] = '字母简称';
	$type['套胶']['E'] = '套胶种类';
	$type['套胶']['F'] = '套胶颜色';
	$type['套胶']['G'] = '海绵厚度';
	$type['套胶']['H'] = '套胶速度';
	$type['套胶']['I']	= '套胶选装';
	$type['套胶']['J'] = '套胶旋转';
	$type['套胶']['K'] = '套胶特性';
	$type['套胶']['L'] = '套胶硬度';
	$type['套胶']['M'] = '产地';
	$type['套胶']['N'] = '零售价';
	$type['套胶']['O']	= '子类别';
	//运动包
	$type['运动包']['A'] = '存货编码';
	$type['运动包']['B'] = '品名';
	$type['运动包']['C'] = '中文简称';
	$type['运动包']['D'] = '字母简称';
	$type['运动包']['E'] = '颜色';
	$type['运动包']['F'] = '尺寸';
	$type['运动包']['G'] = '面料';
	$type['运动包']['H'] = '特性1';
	$type['运动包']['I'] = '特性2';
	$type['运动包']['J'] = '特性3';
	$type['运动包']['K'] = '产地';
	$type['运动包']['L'] = '零售价';
	$type['运动包']['M']	= '子类别';
	//运动鞋
	$type['运动鞋']['A'] = '存货编码';
	$type['运动鞋']['B'] = '品名';
	$type['运动鞋']['C'] = '中文简称';
	$type['运动鞋']['D'] = '字母简称';
	$type['运动鞋']['E'] = '颜色';
	$type['运动鞋']['F'] = '尺码';
	$type['运动鞋']['G'] = '材质';
	$type['运动鞋']['H'] = '鞋底';
	$type['运动鞋']['I'] = '特性1';
	$type['运动鞋']['J'] = '特性2';
	$type['运动鞋']['K'] = '特性3';
	$type['运动鞋']['L'] = '产地';
	$type['运动鞋']['M'] = '零售价';
	$type['运动鞋']['N']	= '子类别';

	foreach ($type as $k => $v) {
		if ($v == $data) return $k;
	}
}