<?php
//管理员管理
include ('D:\work\git\magiczhu_butterfly\config\config.php');//基本配置
include (MODEL_PATH . '/model.php');//数据库操作基类
include (MODEL_PATH . '/adminModel.php');//管理员类
include (MODEL_PATH . '/moduleModel.php');//后台功能模块
include (BASE_PATH . '/common/admin/common.php');//后台常用方法

checkAdminLogin();//检查管理员登录状态

include (ADMIN_VIEW_PATH . '/manage_admin.html');

/**
 * @method 获取管理员列表
 */
function admin_list() {

}

function add_admin() {

}

function commit_add_admin() {

}

function edit_admin() {

}

function commit_edit_admin() {

}