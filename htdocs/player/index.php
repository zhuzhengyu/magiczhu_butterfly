<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$playerModel = new playerModel();

$continent_list = $playerModel->get_continent_list();
$continent = $_GET['continent'] ? $_GET['continent'] : $continent_list[0]['continent'];
// pr($continent_list);

$player_list = $playerModel->get_player_list_by_continent($continent);
include (FRONT_VIEW_PATH . '/player/index.html');
