<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//前台常用方法

$validateCodeModel = new validateCodeModel();
$result = $validateCodeModel->query_validate_code($_POST['code']);

if ($result) {
	$productModel = new productModel();
	$product_detail = $productModel->get_detail_by_product_no($result['product_no']);
	
	$query_times = $result['query_times'] + 1;
	$param['id'] = $result['id'];
	$param['query_times'] = $result['query_times'] + 1;
	$param['query_date_' . $query_times] = date('Y-m-d H:i:s');
	$validateCodeModel->update($param);
	$response_html .= '此商品为正品';
	$response_html .= '<br/>您输入的号码,至今被查询' . $query_times . '次,还可查询' . $left_query_times . '次。';
	$response_html .= '<br/>该产品于' . $result['date'] . '发货至我们蝴蝶' . $result['company'] . '经销商处。';
	$response_html .= '<br/>该号码所对应的产品为' . $product_detail['name'] . '。';
	$response_html .= '<br/>如有疑问可与购买的经销商联系，谢谢。';
	
	$response_html .= '<br/>';
	$response_html .= '<br/>名称:' . $result['name'];
	$response_html .= '<br/>条形码:' . $result['code'];
	$response_html .= '<br/>经销商:' . $result['company'];
	$response_html .= '<br/>型号:' . $result['product_no'];
	$response_html .= '<br/>日期:' . $result['date'];
	exit($response_html);
} else {
	exit('该产品校验码不存在，为假货');
}
