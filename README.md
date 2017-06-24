# phalcon3.2 layui1.09 权限

## 安装phalcon方法 ##
~~~
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install

vim etc/php.ini
extension=phalcon.so

~~~
## 安装方法
~~~
git clone https://github.com/aizxin/blog.git XXX
cd XXX
composer install
cp .env.example .env
~~~
* 修改.env中的 DB配置
* 修改 app/config/config.ini 中的DB配置
* 安装phalcon脚本工具
* 执行以下代码
~~~
phalcon migration generate/run
~~~


## 目录结构

初始的目录结构如下：

~~~
www  WEB部署目录（或者子目录）
├─app                   项目文件
│ ├─controllers         控制器目录
│ ├─library             第三方库目录
│ ├─models              模型目录
│ ├─services            自定义服务目录
│ ├─tasks               任务目录
│ ├─traits              Trait目录
│ └─views               视图目录
├─public                资源目录
│ ├─app                 项目资源目录
│ ├─lib                 第三方资源目录
│ ├─.htaccess           apache重写文件
│ └─index.php           入口文件
├─storage               项目写入仓库
│ ├─cache               项目缓存目录
│ │ ├─data              数据缓存目录
│ │ └─view              视图缓存目录
│ ├─log                 日志目录
│ ├─meta                模型元数据目录
│ └─migrations          数据库迁移目录
├─config                配置文件
├─resources             视图目录
├─vendor                第三方类库目录（Composer依赖库）
├─composer.json         composer定义文件
├─README.md             README文件


## 注意事项 ##
* 利用phalcon脚本新建model时，使用phalcon model name --namespace=App\Models --extends=Model --force
* 【BUG】如果你model里用use加载了其他类库，当你使用官方phalcon工具脚本建立model的时候，会被删除掉。这里可以使用我修改的[devtools](https://github.com/limingxinleo/phalcon-devtools.git)
* 利用phalcon脚本新建controller时，使用phalcon controller name --namespace=App\Controllers\SubNamespace

## 笔记 ##

*禁止渲染试图 $this->view->disable();

## 改包 ##
* 3amprogrammer/phalcon-roles 权限包
* 245行 $builder->columns('DISTINCT p.*');
* 248行后加入 $builder->orderBy('p.issort  asc');

