<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$model = new marketCompanyModel();
$list = $model->get_company_list_by_area_id($_GET['id']);
pr($list);
include (FRONT_VIEW_PATH . '/market/area.html');