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
