SQL: Structured Query Language 
  结构化查询语言，包含 DQL，DML，DDL，DCL 四种语言

DQL: Data Query Language 
    select
  
  
DML: Data Manipulation Language
    insert
    delete 
    update
    merge

DDL: Data Definition Language
    create
    alter
    drop
    rename
    

DCL: Data Control Language
    grand
    revoke 
    commit：
        显示提交：SQL> commit;
        隐式提交：ALTER，AUDIT，COMMENT，CONNECT，CREATE，DISCONNECT，DROP，EXIT，GRANT，NOAUDIT，QUIT，REVOKE，RENAME
        自动提交：SQL> set autocommit on;
    rollback


导致索引失效的原因有哪些？
    对索引列进行 substr 等函数运算
    使用 !=， not in, not exist 等操作符
    单独的 >,<
    like '%abc'
    单独引用符合索引里非第一位置的索引列

表 join 过多怎么优化？
    拆表
    筛选条件前置，缩小 join 数据量
    反范式设计，单表冗余，不使用 join
    代码层面分多次查询，每次查询单表
    
连接：
    inner join / join / ,       内连接，当 on 条件中，任何一边 无法匹配到 另一边值时，都丢弃行 
    cross join                  交叉连接，笛卡尔积，等价于 inner join on 1=1; 
                                和 inner join 的区别是: inner join 带 on 条件，cross join 不带  
                                @trap 在 MySQL 都可以带，没啥区别 
  
    full join                   全连接，当 on 条件中，任何一边 无法匹配到 另一边值时，都保留行
    right join                  右连接，当 on 条件中，右表 无法匹配到 左表值时，保留右表行内容
    left join                   左连接，当 on 条件中，左表 无法匹配到 右表值时，保留左表行内容
    
    自然连接，去掉两表中相同名称的列
    natural inner join
    natural left join
    natural right join


