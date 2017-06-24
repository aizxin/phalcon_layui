layui.use(['form', 'lang', 'sow'], function() {
    var form = layui.form(),
        layer = layui.layer,
        lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery;
    $(function(){
        //监听提交
        form.on('submit(addRoleStore)', function(data) {
            var index = sow.load(1);
            // layer.alert(JSON.stringify(data.field));
            axios.post(sow.U('admin/role/store'), data.field).then(function(response) {
                if (response.data.code == 200) {
                    layer.close(index)
                    sow.msgS(response.data.message,function(){
                        top.layer.closeAll();
                        top.conf.vn.topList();
                    })
                }else{
                    layer.close(index)
                    sow.msgE(response.data.message)
                }
            }).catch(function(error) {
                layer.close(index)
                sow.msgE(lang.sys.error)
            });
            return false;
        });
        var permissionIds =  $('#permissionIds').val();
        if( permissionIds != undefined){
            var permission = permissionIds.split(',');
            for (var i = 0; i < permission.length; i++) {
                $('#role' + permission[i]).prop('checked', true);
            }
            form.render();
        }
        // 角色权限 监听权限选择
        form.on('checkbox(role)', function(data) {
            //单击顶级菜单
            var el = $(data.elem).parent('cite').parent('a').parent('li');
            if (el.length > 0) {
                el.find("ul").each(function(i, n) {
                    $(n).find('input').prop("checked", function() {
                        return data.elem.checked;
                    });
                })
            }
            //单击二级菜单
            var eel = el.parent('ul').parent("li");
            if (eel.length > 0) {
                var had_check = true;
                eel.children('ul').find('li').each(function(i, n) {
                    if ($(n).find('input').prop("checked") && !data.elem.checked) {
                        had_check = false;
                    }
                })
                if (had_check) {
                    eel.children('a').find('input').prop("checked", function() {
                        return data.elem.checked;
                    });
                }
            }
            // 单击三级菜单
            var sel = eel.parent('ul').parent("li");
            if (sel.length > 0) {
                var had_check = true;
                sel.children('ul').find('li').each(function(i, n) {
                    if ($(n).find('input').prop("checked") && !data.elem.checked) {
                        had_check = false;
                    }
                })
                if (had_check) {
                    sel.children('a').find('input').prop("checked", function() {
                        return data.elem.checked;
                    });
                }
            }
            form.render('checkbox');
        });
        //监听  角色权限提交
        form.on('submit(addRolePermissionStore)', function(data) {
            var index = sow.load(1);
            var role = {
                id:data.field.id,
                permissionIds:[]
            }
            layui.each(data.field, function(key, item) {
                if (key != 'id'){
                    role.permissionIds.push(item);
                }
            });
            axios.post(sow.U('admin/role/permission'), role).then(function(response) {
                if (response.data.code == 200) {
                    layer.close(index)
                    sow.msgS(response.data.message,function(){
                        top.layer.closeAll();
                    })
                }else{
                    layer.close(index)
                    sow.msgE(response.data.message)
                }
            }).catch(function(error) {
                layer.close(index)
                sow.msgE(lang.sys.error)
            });
            return false;
        });
    });
});
