{% extends "layouts/common.volt" %}
{% block css %}

{% endblock %}
{% block content %}
<form class="layui-form">
    <input type="hidden" name="<?php echo $this->security->getTokenKey() ?>"
        value="<?php echo $this->security->getToken() ?>"/>
    <input type="hidden" name="id" id="userId" value="{{ id }}">
    <div class="layui-form-item">
        <label class="layui-form-label">{{ lang.t('user.role') }}</label>
        <div class="layui-input-inline">
            <select name="role_id" lay-filter="roleId">
                <option value="0">{{ lang.t('common.up') }}{{ lang.t('role.slug') }}</option>
                {% for item in role %}
                    <option  value="{{ item['id'] }}" <?php echo $user && $user[0]->id == $item['id']?'selected':'' ?>>{{item['name']}}</option>
                {% endfor %}
            </select>
        </div>
    </div>
</form>
{% endblock %}
{% block js %}
<script type="text/javascript" src="{{ static_url('/admin/js/static/user-add.js')}}"></script>
{% endblock %}