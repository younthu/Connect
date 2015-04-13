#Connect设计
## 术语
IMUser, IMUser, IMSession, IMGroup, IMContact, IMConnection

##设计Connect的目的
提供一个可扩展，可定制化的IM解决方案。通过三层结构设计，把数据连接层(IM协议)和业务逻辑层分离，业务逻辑层和UI层分离，达到可以自由替换底层通信逻辑,自由定制UI界面的目的。

##关于UI和业务分离
原则上任何状态变迁后都不支持向上层回调，简化接口设计。上层可以通过监听转态属性值的变化来自己做回调。推荐用ReactiveCocoa来做UI层和数据层的解耦，如果能直接采用MVVM架构当然更好！如果你有发现iOS下面比较好的MVVM架构设计解决方案请告诉我。


##数据层角色划分
主要由User, Contact,Message,Group, Connection, Session,LoginManager构成.

### User
User代表当前登录的用户，大部分app只支持单用户登录，但是我们在设计上支持多用户登录。
### Contact
Contact代表好友，也包括临时好友，匿名用户。Contact不会赋予太多功能，主要提供好友基本信息查询。
### Message
Message可能会是最复杂的一个类簇的基类。消息可能是系统消息，也可能是用户消息。文字，语音，图片消息会是该系统最基本的聊天消息，同时用户可以自由扩展消息类别.所有消息将会通过Message的一个公有接口注入[Message registerClass:(Class)messageClass forType:(NSString*)messageType]. Message子类需要自己实现[Message initWithData:(id)data]实例方法. data 可能是json，可能是xml，也可能是binary,格式类型不做限定. Connection收到消息后会调用[Message buildMessageWithData:(id)data]来实例化消息。

### Message routing
Message routing会是另外一个比较复杂的逻辑。原则上Connection只会处理通信层的一些协议相关的消息，其它系统消息和用户消息都需要在系统启动或者运行时动态接听。

用户消息的路由会比较简单一点，所有用户消息直接路由到UserMessageManager，UserMessageManager在做必要的处理(比如黑名单过滤，消息持久化)之后再路由到User.User再把消息路由到Session, Group和Contact。UI需要同时监听User,Session和Contact的消息数据变化.Session是一个动态概念，主要是用来管理打开的会话窗口数据。

对于不支持的消息类型暂时没有设计对应的解决方案.

系统消息(对应于XMPP里面的iq),每个系统消息都需要对应的handler，handler在系统启动时或者运行时注册到Connection里面，Connection在收到消息后会根据注册表来调用对应的处理逻辑。如果没有找到handler，Connection需要返回一个不支持的操作Response Error,错误消息允许扩展,允许子类化.

Connection注册handler的接口是一个实例方法,所有的服务都应该在Connection创建之后或者创建时注册到Connection实例上面去，注册的消息应该是一个服务提供者的实例.每个服务提供者都应该遵循同一个接口void [SysMessageHandler handleMessage:(IMMessage*)message],接下来所有流程由Handler自己处理. Handler可以自行处理嵌套消息.

### Group
Group是一种特殊类型的User，所有组消息都发送到group实例.

### Connection
数据连接.负责连接，登录，收发消息以及消息路由.消息路由在后期可能会提取到一个独立的dispatcher类里面去，V1消息路由由Connection提供。

### Session
Session主要用来管理聊天窗口，记录当前聊天列表，维护文件传输任务,视频等。

### LoginManager
用于用户登录管理，自动登录管理，多用户管理等。细节有待确定。

## Roadmap
1. 第一阶段可扩展性不会是重点目标，让系统跑起来是最重要的事情。

##问题
1. 对于不支持的用户消息类型现在没有做处理