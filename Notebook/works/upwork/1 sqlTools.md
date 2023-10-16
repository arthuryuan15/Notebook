## 1 Design Overview

https://www.cnblogs.com/lihanqing/p/12329480.html

https://www.oracletutorial.com/oracle-administration/oracle-show-tables/

### 1.1 Background and benefits

An application has been written to determine the effectiveness and appropriateness of using SQL query optimization in an Oracle environment.

### 1.2 Design function list

• allows you to track the history of your queries, done

• easily and transparently illustrate the plan for making any query from the story, done

• can be used to compare queries performed (e.g. using charts depending on the time taken),

• allows you to store selected charts in history,

• provides a pop-up list of tips (including description) that can be used in your query,

• provides the ability to obtain averaged results by repeatedly running the same query,

• allows you to omit the first execution of the query in the calculation (usually the first execution involves more readings from the disk). 

## 2 Database design (if needed)

```mysql
CREATE TABLE `plan_table` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `statement_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'statementId',
  PRIMARY KEY (`id`),
  KEY `idx_assignment_id` (`statement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4
```

```mysql
INSERT INTO plan_table (id, statement_id)
VALUES (1, 111);
```



## 3 Design ideas

1. Queries




1. Charts

   <img src="/Users/yuanjinshuai/Library/Application Support/typora-user-images/image-20210724103205182.png" alt="image-20210724103205182" style="zoom: 33%;" />

2. SQL Console

   ​														<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn3bqd0j30ti0pwaby.jpg" alt="image-20210724103105089" style="zoom:33%;" />

3. About

4. English

## 4 Restful api list





## 5 Schedule

## 6 Remaining problem

JWrapper



```shell
mysql  -u root -h 1.117.200.132 -p
```

![image-20210627113448215](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn04wz2j31030u0mzl.jpg)



### 1 excute sql command 

| Api address | /sqlTools/api/query |
| ----------- | ------------------- |
| Method      | POST                |
| Description | excute sql command  |

```json
{
    "request": { 
        "sqlCommand": "SELECT * from test", // String 必填 活动id assignmentId
        "hint":"hintHASH"
    },
    "response":{
        "code": 200,
        "msg": "ok",
        "data": {
          commandStatus: succ, // succ or fail
          measuredTime: 38.362623, // ms 保留6位小数
          affectedRowNum: 0, // 1 
          "query": "SELECT /*+ USE_HASH(u p a c) */ * from test"
        }

    }
}
```



### 2 excute the explainPlan

| Api address | /sqlTools/api/explainPlan |
| ----------- | ------------------------- |
| Method      | POST                      |
| Description | excute sql command        |

```json
{
    "request": { 
        "query": "select * from book limit 1", // String 必填 活动id assignmentId
    },
    "response":{
        "code": 200,
        "msg": "ok",
        "data": {
          commandStatus: succ, // succ or fail
          Time: 38.362623 // ms 保留6位小数
        }
    }
}
```



```
No.1
No.2 USE_NL
No.3 USE_HASH
No.4 USE_MERGE
```

```mysql
SELECT /*+ USE_NL(u p a c) */ * from test;
SELECT /*+ USE_HASH(u p a c) */ * from test;
SELECT /*+ USE_MERGE(u p a c) */ * from test;
```



```
1| SELECT u.id user_id, r.id role_id
2| FROM users u, roles r, user2role your
3| WHERE u.id=111200 AND ur.user_id=u.id AND ur.role_id=r.id
4| UNION
5| SELECT u.id user_id, r.id role_id
6| FROM users u, roles r, group2role gr, user2group ug
7| WHERE u.id=111200 gr.role_id=r.id AND ug.user_id=u.id AND ug.group_id=gr.group_id
```



```
SELECT id, LPAD(' ',2*(LEVEL-1))||operation operation, options, object_name,  object_alias FROM plan_table
```





```
SELECT id, LPAD(' ',2*(LEVEL-1))||operation operation, options, object_name,  object_alias
  FROM plan_table
  START WITH id = 0 AND statement_id = 'Test 1'
  CONNECT BY PRIOR id = parent_id AND statement_id = 'Test 1'
  ORDER BY id;

 ID OPERATION            OPTIONS    OBJECT_NAME   OBJECT_ALIAS
--- -------------------- ---------- ------------- --------------------
  0 SELECT STATEMENT
  1   HASH JOIN
  2     HASH JOIN
  3       TABLE ACCESS   FULL       DEPARTMENTS   D@SEL$2
  4       TABLE ACCESS   FULL       EMPLOYEES     E@SEL$2
  5     TABLE ACCESS     FULL       T             T@SEL$1

```



execution plan mysql

```mysql
EXPLAIN PLAN SET statement_id =  "111" FOR select * from book;
```

```mysql
mysql> EXPLAIN SELECT email FROM contact
    -> WHERE id = (
    ->     SELECT contact_id  FROM author
    ->     WHERE id = ( SELECT author_id FROM book WHERE NAME = 'java' )
    -> );
```

```mysql
select sid from v$mystat where rownum = 1;
select count(*) from session;
```

https://download.oracle.com/otn_hosted_doc/coherence/330/com/tangosol/coherence/servlet/HttpRequestContext.html

```
EXPLAIN PLAN SET statement_id =  '"+  sessionIdFragment +  "' FOR " + query
```

```mysql
EXPLAIN PLAN SET statement_id = '141' FOR select * from test;
```

```mysql
SELECT  * FROM plan_table WHERE statement_id = '140';
```





## 7 Qustion 1

![Oracle Sample Database](https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn1dxs5j30it0kk76e.jpg)

1. application return the same result when we execute the same request every time?
2. create like this query based on our database

```sql
select * from contacts
```



**4.1 Using indexes to optimize**

==raw==

```sql
SELECT u.name user_name, p.phone_number, a.street_name, c.name city_name
FROM users u, phones p, addresses a, cities c
WHERE u.id=111111 AND u.id=p.user_id AND u.id=a.user_id AND c.id=a.city_id
```

==new==

```sql
SELECT c.first_name first_name, c.last_name last_name, c.email email 
FROM contacts c
WHERE c.first_name=Deneen
```



==raw==

```sql
CREATE INDEX addresses_user_id_idx ON addresses (user_id)
CREATE INDEX phones_user_id_idx ON phones (user_id)
```

==new==

```sql
CREATE INDEX contacts_frist_name_idx ON contacts (frist_name)
```



**4.2 Use of optimizer guidance**

==raw==

```sql
SELECT u.id user_id, r.id role_id
FROM users u, roles r, user2role your
WHERE u.id=111200 AND ur.user_id=u.id AND ur.role_id=r.id
UNION
SELECT u.id user_id, r.id role_id
FROM users u, roles r, group2role gr, user2group ug
WHERE u.id=111200 gr.role_id=r.id AND ug.user_id=u.id AND ug.group_id=gr.group_id AND gr.role_id=r.id
```

The content of the modified query can be seen below (the added passage is bold):

```sql
SELECT u.id user_id, r.id role_id
FROM users u, roles r, user2role your
WHERE u.id=111200 AND ur.user_id=u.id AND ur.role_id=r.id
UNION
SELECT /*+ USE_NL(u ug gr r) */ u.id user_id, r.id role_id
FROM users u, roles r, group2role gr, user2group ug
WHERE u.id=111200 gr.role_id=r.id
```



==new==

```sql
SELECT c.first_name first_name, c.last_name last_name, c.email email 
FROM contacts c
WHERE c.first_name=Deneen 
UNION
SELECT e.first_name first_name, e.last_name last_name, e.email email
FROM employees e
WHERE e.first_name=Deneen
```

The content of the modified query can be seen below (the added passage is bold):

```sql
SELECT c.first_name first_name, c.last_name last_name, c.email email 
FROM contacts c
WHERE c.first_name=Deneen 
UNION
SELECT /*+ USE_NL(u ug gr r) */ e.first_name first_name, e.last_name last_name, e.email email
FROM employees e
WHERE e.first_name=Deneen
```



<img src="https://tva1.sinaimg.cn/large/008vOhrAgy1hiwsn4zh4ij30s20f6go5.jpg" alt="image-20210901151001771" style="zoom:50%;" />

```mysql
SELECT * FROM employees e
```

```sql
SELECT e.first_name first_name, e.last_name last_name, e.email email FROM employees e
```

```mysql
SELECT name FROM customers;
```

```sql
--------------------------------------------------------------------------------------
-- Name	       : OT (Oracle Tutorial) Sample Database
-- Link	       : http://www.oracletutorial.com/oracle-sample-database/
-- Version     : 1.0
-- Last Updated: July-28-2017
-- Copyright   : Copyright � 2017 by www.oracletutorial.com. All Rights Reserved.
-- Notice      : Use this sample database for the educational purpose only.
--               Credit the site oracletutorial.com explitly in your materials that
--               use this sample database.
--------------------------------------------------------------------------------------


---------------------------------------------------------------------------
-- execute the following statements to create tables
---------------------------------------------------------------------------

-- location
CREATE TABLE locations
  (
    location_id NUMBER PRIMARY KEY      ,
    address     VARCHAR2( 255 ) NOT NULL,
    postal_code VARCHAR2( 20 )          ,
    city        VARCHAR2( 50 )          ,
    state       VARCHAR2( 50 )          ,
    country_id  CHAR( 2 )               , -- fk
    CONSTRAINT fk_locations_countries 
      FOREIGN KEY( country_id )
      REFERENCES countries( country_id ) 
      ON DELETE CASCADE
  );
  
-- warehouses
CREATE TABLE warehouses
  (
    warehouse_id NUMBER  PRIMARY KEY,
    warehouse_name VARCHAR( 255 ) ,
    location_id    NUMBER( 12, 0 ), -- fk
    CONSTRAINT fk_warehouses_locations 
      FOREIGN KEY( location_id )
      REFERENCES locations( location_id ) 
      ON DELETE CASCADE
  );
  
-- product category
CREATE TABLE product_categories
  (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2( 255 ) NOT NULL
  );

-- products table
CREATE TABLE products
  (
    product_id NUMBER PRIMARY KEY,
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
-- customers
CREATE TABLE customers
  (
    customer_id NUMBER PRIMARY KEY,
    name         VARCHAR2( 255 ) NOT NULL,
    address      VARCHAR2( 255 )         ,
    website      VARCHAR2( 255 )         ,
    credit_limit NUMBER( 8, 2 )
  );
-- contacts
CREATE TABLE contacts
  (
    contact_id NUMBER PRIMARY KEY,
    first_name  VARCHAR2( 255 ) NOT NULL,
    last_name   VARCHAR2( 255 ) NOT NULL,
    email       VARCHAR2( 255 ) NOT NULL,
    phone       VARCHAR2( 20 )          ,
    customer_id NUMBER                  ,
    CONSTRAINT fk_contacts_customers 
      FOREIGN KEY( customer_id )
      REFERENCES customers( customer_id ) 
      ON DELETE CASCADE
  );
-- orders table
CREATE TABLE orders
  (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER( 6, 0 ) NOT NULL, -- fk
    status      VARCHAR( 20 )  NOT NULL,
    salesman_id NUMBER( 6, 0 )         , -- fk
    order_date  DATE NOT NULL          ,
    CONSTRAINT fk_orders_customers 
      FOREIGN KEY( customer_id )
      REFERENCES customers( customer_id )
      ON DELETE CASCADE,
    CONSTRAINT fk_orders_employees 
      FOREIGN KEY( salesman_id )
      REFERENCES employees( employee_id ) 
      ON DELETE SET NULL
  );
-- order items
CREATE TABLE order_items
  (
    order_id   NUMBER( 12, 0 )                                , -- fk
    item_id    NUMBER( 12, 0 )                                ,
    product_id NUMBER( 12, 0 ) NOT NULL                       , -- fk
    quantity   NUMBER( 8, 2 ) NOT NULL                        ,
    unit_price NUMBER( 8, 2 ) NOT NULL                        ,
    CONSTRAINT pk_order_items 
      PRIMARY KEY( order_id, item_id ),
    CONSTRAINT fk_order_items_products 
      FOREIGN KEY( product_id )
      REFERENCES products( product_id ) 
      ON DELETE CASCADE,
    CONSTRAINT fk_order_items_orders 
      FOREIGN KEY( order_id )
      REFERENCES orders( order_id ) 
      ON DELETE CASCADE
  );
-- inventories
CREATE TABLE inventories
  (
    product_id   NUMBER( 12, 0 )        , -- fk
    warehouse_id NUMBER( 12, 0 )        , -- fk
    quantity     NUMBER( 8, 0 ) NOT NULL,
    CONSTRAINT pk_inventories 
      PRIMARY KEY( product_id, warehouse_id ),
    CONSTRAINT fk_inventories_products 
      FOREIGN KEY( product_id )
      REFERENCES products( product_id ) 
      ON DELETE CASCADE,
    CONSTRAINT fk_inventories_warehouses 
      FOREIGN KEY( warehouse_id )
      REFERENCES warehouses( warehouse_id ) 
      ON DELETE CASCADE
  );
```

```
create table test4(name varchar2(20), city varchar2(20));
```

```sql
SELECT c.first_name first_name, c.last_name last_name, c.email email 
FROM contacts c
WHERE c.first_name='Deneen'
UNION
SELECT e.first_name first_name, e.last_name last_name, e.email email
FROM employees e
WHERE e.first_name='Deneen'
```

select * from contacts



## 8 Depoly

**Backend**

```shell
1. copy local jar file
cd /Users/yuanjinshuai/Documents/AllProjects/workProjects/upWork/sqlTools/sqlToolBackend/target
scp sqlTool-1.0-SNAPSHOT.jar root@1.117.200.132://app/src/upWork/sqlTools/sqlToolBackend/.

2. cd dir
cd /app/src/upWork/sqlTools/sqlToolBackend

3. run 
nohup java -jar sqlTool-1.0-SNAPSHOT.jar &
```

**front end**

```shell
1. copy local zip 
cd /Users/yuanjinshuai/Documents/AllProjects/workProjects/upWork/sqlTools/sqlToolFrontend
tar -zcvf f.tar.gz front-end
scp f.tar.gz root@1.117.200.132://app/src/upWork/sqlTools/sqlToolFrontend/.

2. cd dir
cd /app/src/upWork/sqlTools/sqlToolFrontend

3. unzip
tar -xf f.tar.gz
```



