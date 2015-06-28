<?php
error_reporting(0);
//php模块自动加载方式
function __autoload($class_name) {
	$class_name_array[] = 'model';
	$class_name_array[] = 'adminModel';
	$class_name_array[] = 'excelModel';
	$class_name_array[] = 'logModel';
	$class_name_array[] = 'moduleModel';
	$class_name_array[] = 'productModel';
	$class_name_array[] = 'playerModel';
	$class_name_array[] = 'newsModel';
	$class_name_array[] = 'gameModel';
	$class_name_array[] = 'indexPageModel';
	$class_name_array[] = 'marketCompanyModel';
	$class_name_array[] = 'marketAreaModel';
	$class_name_array[] = 'marketCompanyClassModel';
	$class_name_array[] = 'indexPageModel';
	$class_name_array[] = 'validateCodeModel';

	$class_name_array[] = 'productChengPinPaiModel';
	$class_name_array[] = 'productFuZhuangModel';
	$class_name_array[] = 'productFuJianModel';
	$class_name_array[] = 'productPingPangQiuTaiModel';
	$class_name_array[] = 'productQiuPaiModel';
	$class_name_array[] = 'productTaoJiaoModel';
	$class_name_array[] = 'productYunDongBaoModel';
	$class_name_array[] = 'productYunDongXieModel';
	// 	$class_name_array[] = '';
	if (in_array($class_name, $class_name_array)) {
		include (MODEL_PATH . '/' . $class_name . '.php');
	}
}

//改变数组结构
function change_array($data) {
	foreach ($data as $k => $v) {
		$new_data[$k]['value']		= $v;
		$new_data[$k]['name']		= translate_name($k);
	}
	return $new_data;
}

//翻译部分字段
function translate_name($k) {
	$data['no']						= '存货编码';
	$data['name']					= '品名';
	$data['c_short_name']		= '中文简称';
	$data['e_short_name']		= '字母简称';

	$data['da_fa_lei_bie']			= '打法类别';
	$data['hai_mian_hou_du']	= '海绵厚度';
	$data['he_ban_zhong_lei']	= '合板种类';
	$data['mu_cai']					= '木材';
	$data['mian_ban_cai_zhi']	= '面板材质';
	$data['chan_di']				= '产地';
	$data['price']						= '零售价';
	$data['color']					= '颜色';
	$data['chi_cun']				= '尺寸';
	$data['size']						= '尺寸';
	$data['mian_liao']				= '面料';
	$data['te_xing_1']				= '特性1';
	$data['te_xing_2']				= '特性2';
	$data['te_xing_3']				= '特性3';
	$data['kuan_shi']				= '款式';
	$data['mian_ban_hou_du']= '面板厚度';
	$data['weight']					= '重量';
	$data['zhuo_jiao']				= '桌脚';
	$data['jiao_jie_mian']			= '脚截面';
	$data['te_xing']					= '特性';
	$data['qiu_pai_su_cai']		= '球拍素材';
	$data['ban_bing_xing_zhuang']	= '板柄形状';
	$data['tao_jiao_xuan_zhuan']	= '套胶旋转';
	$data['tao_jiao_su_du']		= '套胶速度';
	$data['tao_jiao_zhong_lei']	= '套胶种类';
	$data['tao_jiao_yan_se']		= '套胶颜色';
	$data['tao_jiao_tan_xing']	= '套胶弹性';
	$data['tao_jiao_xuan_zhuang']	= '套胶选装';
	$data['tao_jiao_ying_du']	= '套胶硬度';
	$data['tao_jiao_te_xing']	= '套胶特性';
	$data['tao_jiao_hou_du']	= '套胶厚度';
	$data['chi_ma']					= '尺码';
	$data['cai_zhi']					= '材质';
	$data['xie_di']					= '鞋底';

	$data['fan_tan_te_xing']		= '反弹特性';
	$data['zhen_dong_te_xing']	= '震动特性';
	$data['ban_mian_xing_zhuang']	= '版面形状';
	$data['qiu_pai_hou_du']		= '球拍厚度';
	$data['qiu_pai_zhong_lei']	= '球拍种类';
	$data['ban_mian_chi_cun']	= '版面尺寸';
	$data['shou_bing_chi_cun']	= '手柄尺寸';

	// 	$data['']		= '';
	// 	$data['']		= '';
	// 	$data['']		= '';
	return $data[$k];
}

function pr($var) {
	echo '<pre>';
	print_r($var);
	echo '</pre>';
}