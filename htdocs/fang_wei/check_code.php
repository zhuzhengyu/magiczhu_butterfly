<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//前台常用方法
$url = CHECK_CODE_URL . '/' . $_GET['code'];
$result = file_get_contents(CHECK_CODE_URL);

pr($url);
pr($result);