# Develop 
## Programming
> 1. Programming Model:
>    - OPP: Procedure Oriented Programming       面向过程编程          C
>    - OOP: Object Oriented Programming          面向对象编程          Java
>    - AOP: Aspect Oriented Programming          面向切面编程          Spring AOP
> 2. Programming Paradigm:
>    - Imperative Programming                    命令式编程            C, Java
>    - Functional Programming                    函数式编程            JS
>    - Reactive Programming                      响应式编程            JavaReactive
> 3. 显式永远优于隐式

## Debug
- 找 bug 永远不要尝试通过结果, 反推问题所在。因为 3+4=7, 但是给你 7 得到这个结果的可能情况太多,根本找不到为什么的, 所以永远不要尝试反推
## Criterion
#### 常量
- 禁止在代码中直接使用常量，例如： i>1, "str".equals(); 必须使用 常量类.字段名 或者 枚举类 替换
#### 异常
- 所有异常无需捕获，直接抛出；受检异常，捕获后重新抛出为非受检异常，禁止在方法上使用 throws 关键字
#### Date&Time
- 日期时间的存储/传递，必须使用时间戳，禁止使用字符串

## Skill
- Recursion,Recursive,Cascade: 编写递归级联算法，先写递归关闭条件，再编写递归操作；根据递归关闭代码的位置分为：前置递归关闭 和 后置递归关闭
- Loop,Circulate: 编写多层循环嵌套算法，先写最内层的循环，再自内而外逐层编写

## Authenticate 身份认证
> 认证类型
> 1. 账号密码
> 2. Token
> 3. Certification
## Authorize 授权
- 资源 - 1:n - 资源动作 - m:n - 角色 - m:n - 用户组 - m:n - 用户


# Glossary&Terminology
- 串行： 指多个 CPU 按顺序执行代码   
- 并行： 指多个 CPU 同时执行，是真正的并发
- 并发： 指单个 CPU 根据一定的算法，调度多个线程进行运算，实际上还是串行     
- 同步： 指多个线程共享相同内存空间时，为避免逻辑错误，同一时间只允许一个线程操作该内存空间    
- API(Application Programming Interface):        
    > 调用者 通过接口调用 实现方 的代码，其中接口在实现方的叫 API  
    > 应用场景：JDK 中各种类的方法 
- SPI(Service Provider Interface):               
    > 调用者 通过接口调用 实现方 的代码，其中接口在调用方的叫 SPI  
    > 应用场景：插件，由主程序调用约定接口，具体实现在插件中，例如：JDBC  
    > 实现方式：  
    >> META-INF/services 目录下创建一个以 "服务接口" 全类名命名的文件  
    >> 该文件中每一行都是一个当前 "服务接口" 实现类的全类名  
    >> 调用者 通过接口调用时，会去读取这些全类名，根据要求找到对应的实现类，并通过反射进行实例化，然后调用  


# HTTP Protocol
- 短连接： HTTP 协议中，一次请求创建一个 TCP 连接，请求返回后立马关闭该连接，且服务器不保存请求相关的数据，即无状态  
- 长连接： HTTP 协议中，一次请求创建一个 TCP 连接，请求返回后服务器不关闭该 TCP 连接，客户端可以通过该 TCP 连接发送多个请求  
- 轮询： 指客户端指定一定时间间隔发送请求到服务器，查看是否有新的数据，有则服务器返回新数据，无则返回空结果  
- 长轮询： 指客户端像轮询一样发送请求到服务器，如果没有新数据，服务器不会立即返回空结果，而是设置一个超时时间，如果在超时时间内出现了新的数据，则返回新数据，如果没有则关闭连接  
- WebSocket： 跟普通是 Socket 一样，维持一个全双工的 TCP 连接，服务器可以随时推送消息到客户端，客户端也可以随时发送数据到服务器  



# Distributed Theory 分布式理论
    CAP：三者中只能存其二，因为分布式必定经过弱网环境，所以 P 肯定需要存在
        Consistency           (强一致性)：   所有子节点中的数据时刻保持一致
        Availability          (高可用性)：   整体能用
        Partition Tolerance   (分区容错性)： 允许部分失败，
    BASE: 尽最大努力，近似实现 CAP 三者
        Basically Available       基本可用
        Soft state                软状态          多个节点时，允许中间某个时刻数据不一致             
        Eventually consistent     最终一致性       只要最后一致即可


## 分布式授权
- OAuth2.0 授权协议
    
    
    
    
    
    
    



