CSPRNG = Cryptographically Secure Pseudo-Random Number Generator = 密码学上安全的伪随机数生成器
IV: Initialization Vector，初始化向量
    是一种在加密算法中使用的随机数值，用于增加加密过程的安全性和可靠性。在块密码加密算法中，IV 是一个固定长度的数据块，通常与密钥一起用于加密和解密数据
    在使用 IV 时，需要注意以下几点：
        IV 应该是随机的，并且每次加密操作都应该使用不同的 IV。
        IV 的长度应该与加密算法的块长度相同。
        IV 应该是保密的，并且只有授权的用户才能访问。
        在使用 IV 时，需要根据具体的加密算法和模式来选择合适的 IV 生成方式。

Message Digest: 消息摘要
    Feature：
        Irreversible：不可逆加密算法，根据密文无法重新得到原文的算法，主要用于保证数据不被篡改
    Algorithm：
        MD5: 对数据进行消息摘要，主要用于保证数据不被篡改 @Deprecated
        SHA：Secure Hash Algorithm，用于对数据完整性校验，以下算法破解难度依次递增
            pbkdf2:  
            bcrypt:
            scrypt:
            argon2: argon2i(对抗 tradeoff[侧信道攻击] 的最安全选择), argon2d(抵抗 GPU 破解攻击的最安全选择), argon2id(兼而有之，推荐)
        

Encrypt：加密
    Feature:
        Reversible：可逆加密算法，根据密文能重新得到原文的算法
    
    Symmetric：
        对称加密算法，即：加密和解密共用同一套秘钥
        Algorithm：
            DES: 数据加密标准 @Deprecated
            AES: Advanced Encryption Standard, 高级加密标准，对称加密算法
            ChaCha20: google 出的对称加密算法
            
    Asymmetric：
        不对称加密算法，具有公钥和私钥，公钥和私钥是一一对应关系，公钥加密的数据只有私钥能解，私钥加密的数据只有公钥能解，不能公钥解公钥，私钥解私钥，
        （虽然公私钥可以互解，但是不能互换，因为知道私钥反推出公钥很简单，但是知道公钥反推出私钥很困难）
        
        Algorithm：
            RSA: 三个创始人的姓氏首字母 @Deprecated
            ECIES(Elliptic Curve Integrated Encryption Scheme): 基于 ECC(Elliptic Curves Cryptography, 椭圆曲线密码编码学) 的加密算法

Encrypt Mode: 加密模式
    ECB: Electronic Mode，电子密码本模式;
         当密文被篡改时，解密后对应的明文分组也会出错，且解密者察觉不到密文被篡改了。
         也就是说，ECB不能提供对密文的完整性校验。因此，在任何情况下都不推荐使用ECB模式。
         
    CBC: Cipher Block Chaining, 密码分组链接模式;
    PCBC: Propagating Cipher Block Chaining
    CCM: Counter/CBC Mode
         是一种循环模式，前一个分组的密文和当前分组的明文异或操作后再加密，这样做的目的是增强破解难度。
         
    CFB: Cipher FeedBack, 密码反馈模式; 
         实际上是一种反馈模式，目的也是增强破解的难度     
         
    OFB: Output FeedBack，输出反馈模式;
         实际上是一种反馈模式，目的也是增强破解的难度。
    
    CTR：Counter Mode，计数器模式;
         解决相同明文会得到相同密文的问题，但不保证消息完整性

    KW: Key Wrap，
    KWP：Key Wrap With Padding
        对称加密密钥的加密模式，用于保护对称密钥的机密性和完整性

    GCM: Galois/Counter Mode

Message Authentication Code：MAC 验证码模式：
    MAC: Message Authentication Code, 消息认证码, 用于保证消息的完整性，
    GMAC: Galois message authentication code mode, 伽罗瓦消息验证码

    AAD: Additional Associated Data，附加关联数据

    AEAD: Authenticated Encryption with Associated Data，带关联数据的经过认证的加密
        GCM: Galois/Counter Mode, 伽罗瓦消息验证码 计数器 模式  
        CCM: Counter/CBC Mode
    

        
    Poly1305: 
    
Padding Mode: 填充模式
    NoPadding
    OAEPPadding:
    PKCS5Padding: RSA 使用
    PKCS7Padding
    
Digital Signature Algorithm: DSA
    数字签名，对数据用不对称加密算法的私钥加密，那么所有拥有公钥的人都能得到这份数据的原文，这样保证该数据是一个人所有，因为私钥是个人保留的
    Algorithm:
        RSA:   基于 对极大整数做因数分解 的 数字签名算法
        ECDSA: 基于 ECC(Elliptic Curves Cryptography) 的 数字签名算法
        EdDSA: 基于 Ed(Edwards-curve) 的 数字签名算法，跟 ECC 区别是: 基于 爱德华曲线，而不是 椭圆曲线，其中 Ed25519 是一种常用的 Edwards 曲线

Key Exchange Protocol: 密钥交换协议
    DHE: Diffie-Hellman Exchange, 迪菲-赫尔曼密钥交换协议
    ECDHE: Elliptic Curve Diffie-Hellman Exchange
    
    2019 密钥交换协议有以下几种：
        RSA 密钥交换 + 无需签名
        ECDHE 密钥交换 + RSA 签名
        ECDHE 密钥交换 + ECDSA 签名: 目前最好的方式
    
    RSA 证书可以用于 RSA 密钥交换（RSA 非对称加密）或 ECDHE 密钥交换（RSA 非对称签名）；而 ECC 证书只能用于 ECDHE 密钥交换（ECDSA 非对称签名）


   
Prefect Forward Secrecy: 
    完美前向保密性：指长期使用的 主密钥 泄漏不会导致过去的 会话密钥 泄漏 



Public Key Infrastructure(PKI) :
    签名过程：
        申请人提交 data 到 ca
        ca 对 data 进行 hash 计算，得到 hashcode
        ca 使用 ca.crt.pem 对应的 pvt.key.pem，对 hashcode 进行加密，得到 ds(Digital Signature)
        ca 将 data + ds 合并成一个文件，这个文件就是 数字证书(DC, Digital Certificate)
    验签过程:
        使用 ca.crt.pem 中的 pub.key.pem 对 数字证书 中的 ds 解密，得到 hashcode1
        使用 相同的 hash 算法 对 data 进行 hash 计算，得到 hashcode2
        对比 hashcode1 和 hashcode2, 如果不一致，则校验失败
    证书链验签过程:
        user 获取 end-user.crt，并提取 end-user.crt 证书的颁发者 intermediate-1
        user 获取 intermediate-1.crt，并提取 intermediate-1.crt 证书的颁发者 intermediate-2
        ...
        user 获取 intermediate-n-1.crt，并提取 intermediate-n-1.crt 证书的颁发者 intermediate-n
        user 获取 intermediate-n.crt，并提取 intermediate-n.crt 证书的颁发者 root
        
        user 获取 root.crt ( root.crt 是预置在 browser 中的，而且是 自签证书 )
        
        使用 root.crt 中的 pub.key 对 intermediate-n.crt 中的 ds 解密，并对比 hashcode 完成验签，如果通过，则继续
        使用 intermediate-n.crt 中的 pub.key 对 intermediate-n-1.crt 中的 ds 解密，并对比 hashcode 完成验签，如果通过，则继续
        使用 intermediate-n-1.crt 中的 pub.key 对 intermediate-n-2.crt 中的 ds 解密，并对比 hashcode 完成验签，如果通过，则继续
        ...
        使用 intermediate-1.crt 中的 pub.key 对 end-user.crt 中的 ds 解密，并对比 hashcode 完成验签，如果通过，则继续
        完成验证过程



File Format Specification: 规定文件中，各个字符的排列顺序，需要存在的 key-value，各个 k-v 的排列组合方式
    X.509:  
        一个文件格式的规范，TLS 证书的格式就是符合这个规范的
    PKCS: Public-Key Cryptography Standards: 公钥密码学标准
        PKCS#1：定义 RSA 公开密钥算法加密和签名机制，主要用于组织 PKCS#7 中所描述的数字签名和数字信封。
        PKCS#3：定义 Diffie-Hellman 密钥交换协议。
        PKCS#5：描述一种利用从口令派生出来的安全密钥加密字符串的方法。使用MD2或MD5 从口令中派生密钥，并采用DES-CBC模式加密。
                主要用于加密从一个计算机传送到另一个计算机的私人密钥，不能用于加密消息。
        PKCS#6：描述了公钥证书的标准语法，主要描述X.509证书的扩展格式。
        PKCS#7：定义一种通用的消息语法，包括数字签名和加密等用于增强的加密机制，PKCS#7与PEM兼容，所以不需其他密码操作，就可以将加密的消息转换成PEM消息[26]。
        PKCS#8：描述私有密钥信息格式，该信息包括公开密钥算法的私有密钥以及可选的属性集等。                                                                # 常见文件后缀: .p8 .pvt.key.pem 
        PKCS#9：定义一些用于PKCS#6证书扩展、PKCS#7数字签名和PKCS#8私钥加密信息的属性类型。
        PKCS#10：描述证书请求语法。                                                                                                              # 常见文件后缀: .p10 .csr 
        PKCS#11：称为Cyptoki，定义了一套独立于技术的程序设计接口，用于智能卡和PCMCIA卡之类的加密设备。
        PKCS#12：描述个人信息交换语法标准。描述了将用户公钥、私钥、证书和其他相关信息打包的语法。                                                          # 常见文件后缀: .p12 .pfx .pkcs12
        PKCS#13：椭圆曲线密码体制标准。
        PKCS#14：伪随机数生成标准。
        PKCS#15：密码令牌信息格式标准。

        PKCS#1 == RSA
        PKCS#13 == DSA    

常见文件扩展名:
    .der:                                   Distinguished Encoding Rules 没有报头，直接是二进制格式存储的，仅仅表示文件内容是 二进制 格式的
    .pem:                                   Privacy Enhanced Mail 有 --BEGIN --END 报头，两者之间是 Base64 编码的字符串，仅仅表示文件内容是 base64 格式的
    
    .key:                                   公钥或者私钥文件 
    .pub.key:                               公钥
    .pvt.key:                               私钥
    .pub.key.der:                           公钥 二进制  格式
    .pub.key.pem:                           公钥 base64 格式
    
    .crt, .cer:                             CA 颁发的 Certificate 证书文件，仅仅包含公钥，没有私钥
    
    .csr, p10:                              Certificate Signing Request: 证书签名请求文件, 
                                            申请人 向 CA 发送证书申请的 请求文件，CA 根据 请求文件 的内容，颁发 证书 给申请人
                                            
    
    
    .pfx .pkcs12, .p12                      Public-Key Cryptography Standards: 公钥密码学标准： 包含公钥和私钥的二进制格式证书，一般会有一个“提取密码”，来提取内容
                                            主要用于 windows 平台，浏览器可以使用，也是 包含证书/公钥 和 私钥，获取私钥需要密码才可以

SSL/TLS 证书:
    按 安全级别 分: 
        DV(Domain Validation) SSL:  只验证网站域名所有权的 简易型 SSL 证书
        OV(Organization Validation) SSL: 额外需要验证网站所有单位的真实身份的  标准型 SSL 证书
        EV(Extended Validation) SSL: 遵循全球统一的严格身份验证标准颁发 的 SSL证书
    按 支持的域名数量 分:
        单域名 证书:
        多域名 证书: 可以支持多个完全不同的顶级域名使用
        通配符 证书: 可以支持同一主域名下同一级的所有子域名
        多域名 通配符 证书:

