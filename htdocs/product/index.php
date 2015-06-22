<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

// $category_name_array['zui_xin']					= '最新';
$category_name_array['cheng_pin_pai']		= '成品拍';
$category_name_array['fu_zhuang']				= '服装';
$category_name_array['fu_jian']					= '附件';
$category_name_array['ping_pang_qiu_tai']	= '乒乓球台';
$category_name_array['qiu_pai']					= '球拍';
$category_name_array['tao_jiao']					= '套胶';
$category_name_array['yun_dong_bao']		= '运动包';
$category_name_array['yun_dong_xie']		= '运动鞋';

$model_list['cheng_pin_pai']		= 'productChengPinPaiModel';
$model_list['fu_zhuang']			= 'productFuZhuangModel';
$model_list['fu_jian']					= 'productFuJianModel';
$model_list['ping_pang_qiu_tai']	= 'productPingPangQiuTaiModel';
$model_list['qiu_pai']					= 'productQiuPaiModel';
$model_list['tao_jiao']				= 'productTaoJiaoModel';
$model_list['yun_dong_bao']	= 'productYunDongBaoModel';
$model_list['yun_dong_xie']		= 'productYunDongXieModel';

$product_class = $_GET['product_class'];
$product_class_name = $category_name_array[$product_class];

$page_no = $_GET['page_no'] ? $_GET['page_no'] : 1;
$per_page = $_GET['per_page'] ? $_GET['per_page'] : 12;

if (!isset($category_name_array[$product_class])) $product_class = 'cheng_pin_pai';
if ($product_class) {
	$productModel = new productModel();
	$condition['category_name']		= $product_class;
	$offset = 12 * ($page_no - 1);
	$list = $productModel->get_list_by_condition($condition, $per_page, $offset);
	$max_row = $productModel->get_max_row($condition);

	$model_name = $model_list[$product_class];
	$model = new $model_name();
	foreach ($list as $k => $v) {
		$product_detail	= $model->get_detail_by_condition(array('no' => $v['no']));
		$product_detail['real_product_id']	= $v['id'];
		$product_list[] =	$product_detail;
	}
}

$first_page = 1;
$last_page = ceil($max_row / $per_page);

$pre_page = $page_no == 1 ? '' : $page_no - 1;
$next_page = $page_no == $last_page ? '' : $page_no + 1;


// pr($first_page);
// pr($last_page);
// pr($pre_page);
// pr($next_page);

// $condition['category_name']	= $_GET['product_class'];
// $model->get_list();
include (FRONT_VIEW_PATH . '/product/index.html');