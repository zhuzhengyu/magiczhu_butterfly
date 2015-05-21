<?php
//经销商分类
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$companyClassModel = new marketCompanyClassModel();
$company_class_list = $companyClassModel->get_list();
$company_class_detail = $companyClassModel->get_detail_by_id(intval($_GET['class_id']));
$company_id_list = str_replace('|', ',', $company_class_detail['company_id_list']);
$companyModel = new marketCompanyModel();
$list = $companyModel->get_company_list_by_id_list($company_id_list);
include (FRONT_VIEW_PATH . '/market/company_class.html');
