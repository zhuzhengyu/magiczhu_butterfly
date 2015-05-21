<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$id = intval($_GET['id']);
$model = new marketCompanyModel();
$list = $model->get_company_list_by_area_id($id);

$areaModel = new marketAreaModel();
$area_detail = $areaModel->get_detail_by_id($id);

$companyClassModel = new marketCompanyClassModel();
$company_class_list = $companyClassModel->get_list();
include (FRONT_VIEW_PATH . '/market/area.html');