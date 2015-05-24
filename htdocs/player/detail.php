<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$playerModel = new playerModel();
$detail = $playerModel->get_detail_by_id($_GET['id']);
$continent_list = $playerModel->get_continent_list();
$achievement = explode('|', $detail['achievement']);
include (FRONT_VIEW_PATH . '/player/detail.html');