{% extends "layouts/common.volt" %}
{% block css %}

{% endblock %}
{% block content %}
<form class="layui-form">
    <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
        <input type="hidden" name="id" value="{{ user.id }}">
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('user.name') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('user.name') }}" value="{{ user.name }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('user.username') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('user.username') }}" value="{{ user.username }}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('user.password') }}</label>
        <div class="layui-input-inline">
            <input type="text" name="password" lay-verify="required" autocomplete="off" class="layui-input" placeholder="{{ lang.t('common.up') }}{{ lang.t('user.password') }}">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addUserStore">{{ lang.t('common.edit') }}</button>
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/user-add.js')}}"></script>
{% endblock %}