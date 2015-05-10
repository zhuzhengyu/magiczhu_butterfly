<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$playerModel = new playerModel();

$player_list = $playerModel->get_player_list();
include (FRONT_VIEW_PATH . '/player/index.html');
