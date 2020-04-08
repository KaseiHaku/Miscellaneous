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


