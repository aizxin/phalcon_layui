layui.use(['form', 'lang', 'sow'], function() {
    var form = layui.form(),
        layer = layui.layer,
        lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery;
    $(function(){
        //监听提交
        form.on('submit(addUserStore)', function(data) {
            var index = sow.load(1);
            // layer.alert(JSON.stringify(data.field));
            axios.post(sow.U('admin/user/store'), data.field).then(function(response) {
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
        //监听提交
        form.on('select(roleId)', function(data) {
            if(data.value == 0){
                sow.msgE(lang.sys.select + lang.role.index)
                return false;
            }
            var index = sow.load(1);
            axios.post(sow.U('admin/user/role'), {id:$("#userId").val(),roleId:data.value}).then(function(response) {
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
            form.render();
        });
    });
});
