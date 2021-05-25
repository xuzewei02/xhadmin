# xhadmin
个人分享搭建项目
目前项目架构为：

xhadmin
    --xhadmin-common:公共组件模块
    --xhadmin-logging:日志模块
    --xhadmin--tools:工具模块
    --xhadmin--system:系统管理

依赖结构为：
             common
                    ↓
              logging
                    ↓
                tools
                    ↓
               system

注意1：
<!--Spring boot 安全框架 加上之后 请求接口 401 后续研究-->
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-security</artifactId>
</dependency>
system启动，测试访问首页
/**
* 访问首页提示
*
* @return /
*/
@AnonymousGetMapping("/")
public String index() {
return "Backend service started successfully";
}
因项目刚搭建，测试访问首页为主，故加以下忽略，首页可正常访问
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})//忽略Springboot 集成的 spring-boot-starter-security 权限认证，后续添加这一块，取消此忽略






注意1：
如果点击图标直接进入redisUtil 则是properties 文件没有起效果，需注入




注意2：
system启动时报错，corsFilter could not found之类的



解决办法有可能是通过 该配置文件解决的，后续再研究


注意3：是因为RoleServiceImpl 没有写或 RoleServiceImpl里没有加注解导致的




遇到下方的异常，需要在IDEA里配置:-Djps.track.ap.dependencies=false


Settings-->Build,Execution,Deployment-->Compiler




启动时报错

则需要配置文件



POSTMAN模拟调用登录：测试账号密码:
admin
123456(传值：EXuXeYxJ85IkgyW+U3dpFi41PggDwev87XodOeA3QR394t22J+an86CV8IbMQFa6eZpwohkzvluwzT1OXZm+zw==)
code:先调用/code接口
uuid:同上

登录测试流程：
localhost:8001/auth/code   get请求，无入参
返回：
{
    "uuid": "code-key-df5040fc516c4685b57c7f6fb915f60a",
    "img": "data:image/png;base64,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"
}

看后台打印日志：
getCode,code:12,uuid:code-key-df5040fc516c4685b57c7f6fb915f60a

第二步，调用登录接口，进行权限认证：

localhost:8001/auth/login   POST请求
入参，其中code值和uuid为第一个接口/code返回：
{"username":"admin",
"password":"EXuXeYxJ85IkgyW+U3dpFi41PggDwev87XodOeA3QR394t22J+an86CV8IbMQFa6eZpwohkzvluwzT1OXZm+zw==",
"code":"12",
"uuid":"code-key-df5040fc516c4685b57c7f6fb915f60a"}

返回:
{
    "user": {
        "dataScopes": [],
        "roles": [
            "admin"
        ],
        "user": {
            "avatarName": "avatar-20200806032259161.png",
            "avatarPath": "/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png",
            "createTime": "2018-08-23 09:11:56",
            "dept": {
                "id": 2,
                "name": "研发部"
            },
            "email": "201507802@qq.com",
            "enabled": true,
            "gender": "男",
            "id": 1,
            "jobs": [
                {
                    "id": 11,
                    "name": "全栈开发"
                }
            ],
            "nickName": "管理员",
            "phone": "18888888888",
            "pwdResetTime": "2020-05-03 16:38:31",
            "roles": [
                {
                    "dataScope": "全部",
                    "id": 1,
                    "level": 1,
                    "name": "超级管理员"
                }
            ],
            "updateTime": "2020-09-05 10:43:31",
            "updatedBy": "admin",
            "username": "admin"
        }
    },
    "token": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI1ZmI0MGJiNWMwMGQ0M2U3YWIyNmZiMDdkY2ExNjRlNiIsInVzZXIiOiJhZG1pbiIsInN1YiI6ImFkbWluIn0.VqEKaEwqwg9qXesJ4qBr51hfJvZz3xEiP2S3skX3UL6vDtOsoQonGcxXVjX6-DcXU3J5XfzMztCHnj-0kvMKgA"
}

自此：第一步，登录权限功能验证通过










































































































