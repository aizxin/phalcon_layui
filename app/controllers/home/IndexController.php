<?php
namespace Sow\Controllers\Home;

use Sow\Controllers\Controller;
use Sow\Models\Permission;
use Sow\Models\Role;
class IndexController extends Controller
{
    /**
     * 初始化
     */
    public function onConstruct(){
    }
    /**
     * 资源初始化
     */
    public function initialize() {
    }
    public function indexAction()
    {
        var_dump("role");
        $this->view->disable();
    }
    public function showAction($id)
    {
        var_dump($id);
        var_dump('expression');
        $this->view->disable();
    }

    public function targetAction()
    {
        var_dump(Permission::find()->toArray());
        var_dump($this->pRepo);
        echo "路由命名测试";
    }
}

