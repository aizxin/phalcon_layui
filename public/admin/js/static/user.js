layui.use(['sow', 'lang', 'form', 'laypage'], function() {
    var lang = layui.lang,
        sow = layui.sow,
        $ = layui.jquery
    form = layui.form();
    $(function() {
        window.conf.vn = new Vue({
            el: '#app',
            data: {
                users: [],
                pages: 0,
                search: {
                    pageSize: 15
                }
            },
            created: function() {
                this.list();
            },
            methods: {
                list: function() {
                    var _this = this;
                    axios.post(sow.U('admin/user'), this.search).then(function(response) {
                        if (_this.pages != response.data.result.total_pages) {
                            _this.$set(_this, 'pages', response.data.result.total_pages);
                            _this.page();
                        }
                        _this.$set(_this, 'users', response.data.result.items);
                        _this.$nextTick(function() {
                            form.render();
                        });
                    }).catch(function(error) {
                        console.log(error);
                    });
                },
                // 分页
                page: function() {
                    var _this = this;
                    layui.laypage({
                        cont: 'page',
                        pages: this.pages,
                        skip: true,
                        jump: function(obj, first) {
                            if (!first) {
                                _this.search.page = obj.curr;
                                _this.list();
                            }
                        }
                    });
                },
                changePage: function(pages) {
                    this.$set(this, 'search.pageSize', pages);
                    this.list();
                },
                addHtml: function() {
                    sow.open(lang.user.create, sow.U("admin/user/create"), ['530px', '275px']);
                },
                topList: function() {
                    this.search.pageSize = 15;
                    this.search.page = 1;
                    this.list();
                },
                editHtml: function(id) {
                    sow.open(lang.user.edit, sow.U("admin/user/" + id + "/edit"), ['530px', '275px']);
                },
                allDel: function() {
                    var ids = [];
                    var child = $('.layui-table').find('tbody input[type="checkbox"]');
                    child.each(function(index, item) {
                        if (item.checked) {
                            ids.push(item.value)
                        }
                    });
                    if (!ids.length) {
                        sow.msgE(lang.user.delE);
                        return;
                    };
                    this.elDel(ids);
                },
                elDel: function(id) {
                    var _this = this;
                    sow.confirm(lang.sys.del, lang.sys.clear + lang.user.index, function(index) {
                        layer.close(index);
                        var indexload = sow.load(1)
                        axios.post(sow.U('admin/user/destroy'), { id: id }).then(function(response) {
                            if (response.data.code == 200) {
                                layer.close(indexload);
                                sow.msgS(response.data.message, function() {
                                    _this.topList();
                                });
                            } else {
                                layer.close(indexload);
                                sow.msgE(response.data.message);
                            }
                        }).catch(function(error) {
                            layer.closeAll();
                            sow.msgE(lang.sys.error);
                        });
                    })
                },
                editRoleHtml:function(id){
                    sow.open(lang.role.permission, sow.U("admin/user/show/" + id ), ['530px', '275px']);
                }
            }
        });
        //监听查询
        form.on('submit(searchUser)', function(data) {
            window.conf.vn.$set(window.conf.vn, 'search.page', 1);
            window.conf.vn.$set(window.conf.vn, 'search.name', data.field.name);
            window.conf.vn.list();
            return false;
        });
    });
});
