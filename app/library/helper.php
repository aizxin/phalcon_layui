<?php
// +----------------------------------------------------------------------
// | Demo [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.lmx0536.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: limx <715557344@qq.com> <http://www.lmx0536.cn>
// +----------------------------------------------------------------------
// | Date: 2016/11/9 Time: 9:55
// +----------------------------------------------------------------------
use Phalcon\Di\FactoryDefault as DI;

/**
 * [di desc]
 * @desc 获取容器对象
 * @author limx
 * @param $name 容器服务名
 * @return mixed
 */
if (!function_exists('di')) {
    function di($name = null, $isNew = false)
    {
        $di = DI::getDefault();
        if ($name == null) return $di;
        if ($isNew === false) return $di->getShared($name);
        return $di->get($name);
    }
}

/**
* 获取.env文件下的变量值
* @param string $key
* @param null $default
* @return null|string
*/
if (! function_exists('env')) {
    function env(string $key, $default = null)
    {
        static $properties = null;
        $key = strtoupper($key);

        if (!$properties) {
            $properties = new Phalcon\Config\Adapter\Ini(BASE_PATH . '/.env');
        }
        if (isset($properties[$key]) && $properties[$key]) {
            return $properties[$key];
        } else {
            return $default;
        }
    }
}

/**
 *  [apiSuccess api成功返回]
 *  @author Sow
 *  @DateTime 2017-06-03T00:19:56+0800
 */
if (!function_exists('apiSuccess')) {
    function apiSuccess($data = [],$msg = '')
    {
        $result = [
            'code' => 200,
            'result' => $data,
            'message' => $msg
        ];
        return di('response')->setJsonContent($result);
    }
}

/**
 *  [apiError api错误返回]
 *  @author Sow
 *  @DateTime 2017-06-03T00:21:16+0800
 */
if (!function_exists('apiError')) {
    function apiError($msg = '')
    {
        $result = [
            'code' => 400,
            'message' => $msg
        ];
        return di('response')->setJsonContent($result);
    }
}

/**
 *  [setPassword 加密]
 *  @author Sow
 *  @DateTime 2017-06-03T14:48:58+0800
 *  @param    [type]                   $password [description]
 */
if ( !function_exists('setMd5')) {
    function setMd5($password){
        return sha1(md5( $password . env('UNIQUE_ID') ));
    }
}
/**
 *  递归迭代无限级分类
 */
if (! function_exists('sort_parent')) {
    /**
     *  [sort_parent description]
     */
    function sort_parent($menus,$pid=0)
    {
        $arr = [];
        if (empty($menus)) {
            return '';
        }
        foreach ($menus as $key => $v) {
            if ($v['parent_id'] == $pid) {
                $v['child'] = sort_parent($menus,$v['id']);
                $arr[] = $v;
            }
        }
        return $arr;
    }
}
if (! function_exists('array2object')) {
    /**
     *  [sort_parent description]
     */
    function array2object($array) {
      if (is_array($array)) {
        $obj = new StdClass();
        foreach ($array as $key => $val){
          $obj->$key = $val;
        }
      }
      else { $obj = $array; }
      return $obj;
    }
}
