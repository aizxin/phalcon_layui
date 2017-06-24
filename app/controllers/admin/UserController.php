<?php

namespace Sow\Controllers\Admin;

use Sow\Controllers\Admin\BaseController;
use Sow\Repositories\Admin\UserRepository;
use Sow\Repositories\Admin\RoleRepository;
use Sow\Validations\AuthValidation;

class UserController extends BaseController
{
    protected $uRepo;
    protected $uVa;
    public function initialize()
    {
        parent::initialize();
        $this->uRepo = UserRepository::repositoryInit();
        $this->uVa = AuthValidation::validateInit();
    }

    /**
     *  [indexAction 管理员列表]
     *  @author Sow
     *  @DateTime 2017-06-04T16:37:46+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $permission = $this->uRepo->getPage($this->request->getJsonRawBody());
            return apiSuccess($permission,$this->lang->_('setting.success'));
        }
        $this->view->pick('admin/user/index');
    }
    /**
     *  [showAction 角色管理员]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function showAction($id)
    {
        $role = RoleRepository::repositoryInit();
        $this->view->id = $id;
        $this->view->role = $role->all()->toArray();
         $this->view->user = $this->uRepo->find($id)->getRoles();
        $this->view->pick('admin/user/role');
    }
    /**
     *  [createAction 管理员添加视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function createAction()
    {
        $this->view->pick('admin/user/create');
    }
    /**
     *  [storeAction 管理员添加/更新操作]
     *  @author Sow
     *  @DateTime 2017-06-11T20:08:28+0800
     *  @return   [type]                   [description]
     */
    public function storeAction()
    {
        $request = $this->request->getJsonRawBody();
        //验证数据
        if(!$this->uVa->validator($request))
            return apiError($this->uVa->firstMessage());
        //防止攻击
        if (!$this->securityCSRF($request))
            return apiError($this->lang->t('handle.check.token'));
        try {
            $user = $this->uRepo->storeUser($request);
            $this->security->destroyToken();
            return apiSuccess(count($user),isset($request->id)?$this->lang->t('handle.update.success'):$this->lang->t('handle.create.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError(isset($request->id)?$this->lang->t('handle.update.failed'):$this->lang->t('handle.create.failed'));
        }
    }
    /**
     *  [createAction 管理员更新视图]
     *  @author Sow
     *  @DateTime 2017-06-09T22:00:51+0800
     *  @return   [type]                   [description]
     */
    public function editAction($id)
    {
        $this->view->user = $this->uRepo->find($id);
        $this->view->pick('admin/user/edit');
    }
    /**
     *  [destroyAction 删除管理员]
     *  @author Sow
     *  @DateTime 2017-06-12T22:19:27+0800
     *  @param    string                   $value [description]
     *  @return   [type]                          [description]
     */
    public function destroyAction()
    {
        $request = $this->request->getJsonRawBody();
        try {
            $user = $this->uRepo->destroyUser($request);
            return apiSuccess($user,$this->lang->t('handle.delete.success'));
        } catch (\Phalcon\Exception $e) {
            return apiError($this->lang->t('handle.delete.failed'));
        }
    }
    /**
     *  [roleAction 角色添加/更新]
     *  @author Sow
     *  @DateTime 2017-06-24T12:25:37+0800
     *  @return   [type]                   [description]
     */
    public function roleAction()
    {
        $request = $this->request->getJsonRawBody();
        try {
            $role = RoleRepository::repositoryInit();
            $data = $role->find($request->roleId);
            $user = $this->uRepo->find($request->id);
            $user->detachAllRoles();
            $res = $user->attachRole($data);
            return apiSuccess($res,$this->lang->t('handle.create.success'));
        } catch (\Phalcon\Mvc\Model\Exception $e) {
            return apiError($this->lang->t('handle.create.failed'));
        }
    }

}

