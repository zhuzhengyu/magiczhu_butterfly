<?php
include ('../../config/config.php');//基本配置
include (BASE_PATH . '/common/front/common.php');//后台常用方法

$newsModel = new newsModel();

$detail = $newsModel->get_news_detail_by_id(intval($_GET['id']));
include (FRONT_VIEW_PATH . '/news/detail.html');