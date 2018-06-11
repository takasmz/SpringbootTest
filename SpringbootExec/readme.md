# 环境准备
- JDK8
- Eclipse EE版（如果JDK是64位，Eclipse需与JDK一致）
- Mysql5社区版和SqlWorkbench
- maven3.5，并完成Eclipse中maven的配置

# 运行
## 建立数据库
 > 参照 application.properties中的数据源配置建立空数据库和账号
## 运行
 > 在Eclipse中运行：找到MainApplication,右键->run as java Application
 > 打包运行，Eclipse中工程上右键->run as maven build
## 初始化数据库表数据
 > 执行init.sql导入初始数据,或者访问http://ip:port/init，系统也会自动生成初始数据
## 了解功能
 > 点击各项菜单，看看实现了哪些功能，哪些没有实现
 
# 开发
 如果你想参照此DEMO进行开发，尽量遵从下面步骤
---
## 建立工程
- 新建工程参照pom.xml下载所需依赖
- 确保工程编码采用UTF-8
- resource下建立application.properties文件，并理解其中配置的意义和如何修改
- 新建包（例如com.xxx）,并参照MainApplication,建立自己的Application
- 确保8080端口不冲突，如果已经有其它软件系统再使用这个端口，修改application.properties文件中的服务端口配置
- 运行自己的Application，启动后用浏览器访问

## 建立模型层
- 新建模型包（例如com.xxx.model或com.xxx.domain）
- 参照com.springbootexec.model下编写Pojo类，注意学习其中JPA注解的写法
- 运行自己的Application，检查数据库中是否完成了自动建表任务 

## 建立DAO层
- 新建DAO包（例如com.xxx.dao或com.xxx.services，对于业务功能逻辑复杂的系统，需要两个都建）
- 参照com.springbootexec.dao编写JPA Repository类

## 编写控制器
- 确保将前端静态页面及相关内容已经拷贝到resources下了，其中模版部分拷贝到templates下，静态css，image，js文件拷贝到static下，注意要确保模版文件（ftl）中引用的静态文件路径正确 
- 根据你想完成的功能，编写相应的控制器，参照com.springbootexec.controller

## 后续任务
在原样实现了本系统作为练习后，你可以进一步对系统进行完善，以下待实现功能可供参考:
- 登陆以后右上角显示了登陆用户名，点击下拉菜单，里面的内容都没有实现，特别是注销功能
- 资源下载界面缺少"实验资源",你可以尝试补充
- 资源下载界面添加分页功能
- 学生上传作业并显示自己交作业历史记录。作业可以为文件的形式上传
- 教师查看作业交纳情况统计，包括按照次数显示已经交纳人数，以及按照学生查看交纳情况
- 课程简介和教师队伍md文件的显示和在线编辑功能
- 课程大纲和课表的PDF文件显示功能