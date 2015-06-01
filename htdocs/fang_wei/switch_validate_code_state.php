<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//前台常用方法

$validateCodeModel = new validateCodeModel();
$result = $validateCodeModel->query_validate_code($_POST['code']);