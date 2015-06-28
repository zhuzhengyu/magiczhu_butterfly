<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$productModel = new productModel();
$product_id = intval($_GET['product_id']);
$detail = $productModel->get_detail_by_id($product_id);

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

$product_class = $detail['category_name'];
$product_class_name = $model_list[$product_class];

$condition['no']	= $detail['no'];
$model = new $product_class_name();
$real_detail = $model->get_detail_by_condition($condition);
unset($real_detail['id'], $real_detail['is_delete'], $real_detail['create_date'], $real_detail['update_date']);
$show_detail = change_array($real_detail);

include (FRONT_VIEW_PATH . '/product/detail.html');