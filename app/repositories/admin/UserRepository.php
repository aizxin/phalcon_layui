<?php
namespace Sow\Repositories\Admin;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\User;
use Sow\Traits\Repository;

class UserRepository extends AbstractRepository
{
    use Repository;
    final protected function __construct()
    {
        $this->model = User::modelInit();
    }
    /**
     *  [getPage 获取分页数据]
     *  @author Sow
     *  @DateTime 2017-06-04T17:21:56+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function getPage($request)
    {
        $map = [];
        if(!empty($request->name))
            $map['name'] = ['%'.$request->name.'%', 'LIKE'];
        return $this->getPaginate($map,$request);
    }
    /**
     *  [postLogin 管理员登录]
     *  @author Sow
     *  @DateTime 2017-06-03T00:02:46+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function postLogin($request)
    {
        $data['name'] = $request->name;
        $userInfo = $this->firstBy($data);
        if(!$userInfo){
            throw new \Phalcon\Exception(di('lang')->t('user.login.error'));
            return false;
        }
        if($userInfo->password != setMd5($request->password)){
            throw new \Phalcon\Exception(di('lang')->t('user.login.error'));
            return false;
        }
        $permissions = json_encode($userInfo->getPermissions());
        di('cache')->save('userPermissions',json_decode($permissions,true));
        di('session')->set('userInfo',$userInfo->toArray());
        return $userInfo;
    }
    /**
     *  [storeUser 管理员添加或更新]
     *  @author Sow
     *  @DateTime 2017-06-20T22:43:49+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function storeUser($request)
    {
        $data = [
            'name'=>$request->name,
            'username'=>$request->username,
            'password'=>setMd5($request->password)
        ];
        if (isset($request->id)){
            return $this->updateById($request->id,$data);
        }else{
            return $this->create($data);
        }
    }
}