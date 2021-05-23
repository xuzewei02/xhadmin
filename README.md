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















































































































