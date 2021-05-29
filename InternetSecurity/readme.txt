Encrypt Algorithm：加密算法
    Irreversible：不可逆加密算法，根据密文无法重新得到原文的算法，主要用于保证数据不被篡改
        MD5: 对数据进行消息摘要，主要用于保证数据不被篡改 @Deprecated
        SHA：Hash Algorithm，用于对数据完整性校验
    Reversible：可逆加密算法，根据密文能重新得到原文的算法
        Symmetric：对称加密算法，加密和解密共用同一套秘钥
            DES: 数据加密标准 @Deprecated
            AES: Advanced Encryption Standard, 高级加密标准，对称加密算法
                CTR：Counter Mode，计数器模式，解决相同明文会得到相同密文的问题，但不保证消息完整性
                MAC: Message Authentication Code, 消息认证码, 用于保证消息的完整性，
                GMAC: Galois message authentication code mode, 伽罗瓦消息验证码
                GCM: Galois/Counter Mode, 伽罗瓦消息验证码 计数器 模式
            ChaCha20: google 出的对称加密算法
        Asymmetric：不对称加密算法，具有公钥和私钥，公钥和私钥是一一对应关系，公钥加密的数据只有私钥能解，私钥加密的数据只有公钥能解，不能公钥解公钥，私钥解私钥，
                      （虽然公私钥可以互解，但是不能互换，因为知道私钥反推出公钥很简单，但是知道公钥反推出私钥很困难）
            RSA: 三个创始人的姓氏首字母 @Deprecated
            ECC: Elliptic Curves Cryptography, 椭圆曲线密码编码学

Key Exchange Protocol: 密钥交换协议
    DHE: Diffie-Hellman Exchange, 迪菲-赫尔曼密钥交换协议
    ECDHE: Elliptic Curve Diffie-Hellman Exchange
    
    2019 密钥交换协议有以下几种：
        RSA 密钥交换 + 无需签名
        ECDHE 密钥交换 + RSA 签名
        ECDHE 密钥交换 + ECDSA 签名: 目前最好的方式
    
    RSA 证书可以用于 RSA 密钥交换（RSA 非对称加密）或 ECDHE 密钥交换（RSA 非对称签名）；而 ECC 证书只能用于 ECDHE 密钥交换（ECDSA 非对称签名）

Digital Signature Algorithm: DSA
    数据签名，对数据用不对称加密算法的私钥加密，那么所有拥有公钥的人都能得到这份数据的原文，这样保证该数据是一个人所有，因为私钥是个人保留的
   
Prefect Forward Secrecy: 
    完美前向保密性：指长期使用的 主密钥 泄漏不会导致过去的 会话密钥 泄漏 


Key:
    一个 key 文件携带的字节（.pem .der） = key 本身用于加解密使用的字节 + 额外描述 key 本身信息的字节
    X.509 和 PKCS 标准定义的就是：额外信息有哪些，及其排列组织方式。

    
x509, DSA Key, RSA Key 保存到文件使用的编码格式：
    PEM: Privacy Enhanced Mail              有 --BEGIN --END 报头，两者之间是 Base64 编码的字符串
    DER: Distinguished Encoding Rules       没有报头，直接是二进制格式存储的
    
PKCS: Public-Key Cryptography Standards: 公钥密码学标准
    PKCS#1：定义 RSA 公开密钥算法加密和签名机制，主要用于组织 PKCS#7 中所描述的数字签名和数字信封。
    PKCS#3：定义 Diffie-Hellman 密钥交换协议。
    PKCS#5：描述一种利用从口令派生出来的安全密钥加密字符串的方法。使用MD2或MD5 从口令中派生密钥，并采用DES-CBC模式加密。
            主要用于加密从一个计算机传送到另一个计算机的私人密钥，不能用于加密消息。
    PKCS#6：描述了公钥证书的标准语法，主要描述X.509证书的扩展格式。
    PKCS#7：定义一种通用的消息语法，包括数字签名和加密等用于增强的加密机制，PKCS#7与PEM兼容，所以不需其他密码操作，就可以将加密的消息转换成PEM消息[26]。
    PKCS#8：描述私有密钥信息格式，该信息包括公开密钥算法的私有密钥以及可选的属性集等。
    PKCS#9：定义一些用于PKCS#6证书扩展、PKCS#7数字签名和PKCS#8私钥加密信息的属性类型。
    PKCS#10：描述证书请求语法。
    PKCS#11：称为Cyptoki，定义了一套独立于技术的程序设计接口，用于智能卡和PCMCIA卡之类的加密设备。
    PKCS#12：描述个人信息交换语法标准。描述了将用户公钥、私钥、证书和其他相关信息打包的语法。
    PKCS#13：椭圆曲线密码体制标准。
    PKCS#14：伪随机数生成标准。
    PKCS#15：密码令牌信息格式标准。
    
    PKCS#1 == RSA
    PKCS#13 == DSA

常见文件扩展名:
    .crt, .cer:                             Certificate 证书文件
    .key:                                   公钥或者私钥文件 
    .csq:                                   Certificate Signing Request: 证书签名请求文件
    .pkcs12, .p12, .pfx                     Public-Key Cryptography Standards: 公钥密码学标准： 包含公钥和私钥的二进制格式证书，一般会有一个“提取密码”，来提取内容


