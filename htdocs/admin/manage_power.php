<?php
//管理权限
include ('../../config/config.php');//基本配置
include (MODEL_PATH . '/model.php');//数据库操作基类
include (MODEL_PATH . '/adminModel.php');//管理员类
include (MODEL_PATH . '/moduleModel.php');//后台功能模块
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

$module_id = isset($_GET['module_id']) ? $_GET['module_id'] : '';

checkAdminLogin();//检查管理员登录状态
// $adminPassport = new adminPassport();
$username = $_SESSION['username'];
// $adminPassport->checkLogin();//检测登录状态

$adminModel = new adminModel();
$power = $adminModel->get_power($username);

$moduleModel = new moduleModel();
$module_list = $moduleModel->get_module_list_detail($power);
// $all_module = $moduleModel->get_all_module();
$module_detail = $module_id ? $module_id : current($module_list);

$sub_module_list = $moduleModel->get_sub_module($module_detail['id']);

$all_admin = $adminModel->get_all_admin();

include (ADMIN_VIEW_PATH . '/home.html');


