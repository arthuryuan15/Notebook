https://anqicao.space/




本地mysql
```shell
mysql -uroot -p127.0.0.1 -p
```

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| eesy               |
| information_schema |
| laravel            |
| meter              |
| mysql              |
| performance_schema |
| Ruoyi              |
| sys                |
| test               |
| webtree            |
| webtree_test       |
+--------------------+
11 rows in set (0.00 sec)
```



云mysql

```shell
 mysql -uroot -h 1.117.200.132 -pAmerican94#
```



```shell
ssh root@1.117.200.132 -pAmerican94#
```

```shell
sshpass -p 'American94#' ssh root@1.117.200.132
```

```
 CREATE TABLE products
  (
    product_id NUMBER NOT NULL
               PRIMARY KEY,
    product_name  VARCHAR2( 255 ) NOT NULL,
    description   VARCHAR2( 2000 )        ,
    standard_cost NUMBER( 9, 2 )          ,
    list_price    NUMBER( 9, 2 )          ,
    category_id   NUMBER NOT NULL         ,
    CONSTRAINT fk_products_categories 
      FOREIGN KEY( category_id )
      REFERENCES product_categories( category_id ) 
      ON DELETE CASCADE
  );
  select * from all_tables where owner='LHQ'; 
```



working path:`/app/src/.`

Deploy:

```shell
1. copy local jar file
cd /Users/yuanjinshuai/Documents/AllProjects/workProjects/upWork/sqlTools/sqlToolBackend/target
scp sqlTool-1.0-SNAPSHOT.jar root@1.117.200.132://app/src/upWork/sqlTools/sqlToolBackend/.

2. cd dir
cd /app/src/upWork/sqlTools/sqlToolBackend

3. run 
nohup java -jar sqlTool-1.0-SNAPSHOT.jar &
```



