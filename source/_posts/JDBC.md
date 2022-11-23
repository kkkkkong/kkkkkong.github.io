---
date: 2022-05-25 12:00:00
title: "JDBC学习笔记"
author: "kong"
tags: [java ,JDBC]

---

## JDBC

### 技术体系

![image-20220511151328240](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220511151328240.png)

### 一、概述

![image-20220511193455866](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220511193455866.png)

> JDBC由java官方定义的一组标准：接口；对应各个数据库厂商实现对应的方法即驱动
>
> JDBC(Java Database Connectivity)是一个**独立于特定数据库管理系统、通用的SQL数据库存取和操作的公共接口**（一组API），定义了用来访问数据库的标准Java类库，（**java.sql,javax.sql**）使用这些类库可以以一种**标准**的方法、方便地访问数据库资源。

- 在使用JDBC情况下访问数据库

  ![image-20220525143030809](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220525143030809.png)

#### JDBC程序编写步骤

![image-20220511194633369](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220511194633369.png)

### 二、获取数据库连接

> 方式一到五，1-4作为过程存在，了解即可

- 方式五

  - ```java
    /**
         * 获取数据库连接
         * @return
         * @throws Exception
         */
        public static Connection getConnection() throws Exception {
    //        读取配置文件信息
            InputStream ips = ClassLoader.getSystemClassLoader().getResourceAsStream("jdbc.properties");
            Properties pros=new Properties();
            pros.load(ips);
            String user = pros.getProperty("user");
            String password = pros.getProperty("password");
            String url = pros.getProperty("url");
            String driverClass = pros.getProperty("driverClass");
    //        2.加载驱动
            Class.forName(driverClass);
    //        3.连接
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println(conn);
            return conn;
        }
    ```

  - 配置文件jdbc.properties存放在src下

    - ```xml
          user=root
          password=123456
          url=jdbc:mysql://localhost:3306/test?serverTimezone=GMT
          driverClass=com.mysql.cj.jdbc.Driver
      
      ```

      

### 三、JDBCUtils.java

```java
package utils;
/**
 *
 * 操作数据库的工具类
 *
 */

public class JDBCUtils {
    /**
     * 获取数据库连接
     * @return
     * @throws Exception
     */
    public static Connection getConnection() throws Exception {
//        读取配置文件信息
        InputStream ips = ClassLoader.getSystemClassLoader().getResourceAsStream("jdbc.properties");
        Properties pros=new Properties();
        pros.load(ips);
        String user = pros.getProperty("user");
        String password = pros.getProperty("password");
        String url = pros.getProperty("url");
        String driverClass = pros.getProperty("driverClass");
//        2.加载驱动
        Class.forName(driverClass);
//        3.连接
        Connection conn = DriverManager.getConnection(url, user, password);
        System.out.println(conn);
        return conn;

    }

    /**
     * 关闭连接和statement操作
     * @param conn
     * @param ps
     */
    public static void closeResource(Connection conn, Statement ps){
        //        资源关闭
        try {
            if(ps!=null){
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static void closeResource(Connection conn, Statement ps, ResultSet rs){
        //        资源关闭
        try {
            if(ps!=null){
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(rs!=null){
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
//    使用dbutils提供的close关闭数据库资源
    public static void closeResource1(Connection conn, Statement ps, ResultSet rs){
        DbUtils.closeQuietly(conn);
        DbUtils.closeQuietly(ps);
        DbUtils.closeQuietly(rs);

    }
}

```



### 四、使用preparedStatement实现CRUD

#### 4.1 使用statement的问题

- **问题一：存在拼串操作，繁琐**
- **问题二：存在SQL注入问题**
  - SQL 注入是利用某些系统没有对用户输入的数据进行充分的检查，而在用户输入数据中注入非法的 SQL 语句段或命令(如：SELECT user, password FROM user_table WHERE user='a' OR 1 = ' AND password = ' OR '1' = '1') ，从而利用系统的 SQL 引擎完成恶意行为的做法。
- 无法操作Blob类型数据
- 实现批量插入时，效率较低

#### 4.2 使用preparestatement

- 介绍

  - 是statement的子接口
  - 使用预编译sql语句
  - 可以解决sql注入问题，实现高效的批量操作

- 通用增删改操作（V1.0）

  - ```java
        public void update(String sql,Object ...args) {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
    //        占位符的个数等于可变形参的个数
                conn = JDBCUtils.getConnection();
                ps = conn.prepareStatement(sql);
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
    //            方式一：如果执行的查询操作又返回结果，此方法返回true；执行增删改，无返回结果，返回false
    //            ps.execute();
    //            方式二：
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                JDBCUtils.closeResource(conn,ps);
            }
    
        }
    ```

    

- 通用查询操作（V1.0）

  - ```java
    
        /**
        *
        *@author Kong
        *@Description 针对不同表的通用查询操作，返回表中的一组记录
        *@Date 22:12 2022/5/19
        *@Param
        *@Return
        **/
        public <T> List<T> getForList(Class<T> clazz, String sql, Object ...args){
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = JDBCUtils.getConnection();
                ps = conn.prepareStatement(sql);
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
                rs = ps.executeQuery();
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                ArrayList<T> list = new ArrayList<>();
                while(rs.next()){
                    T t = clazz.newInstance();
                    for(int i=0;i<columnCount;i++){
                        Object value = rs.getObject(i + 1);
                        String columnLabel = rsmd.getColumnLabel(i + 1);
                        Field field = clazz.getDeclaredField(columnLabel);
                        field.setAccessible(true);
                        field.set(t,value);
                    }
                    list.add(t);
                }
                return list;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                JDBCUtils.closeResource(conn,ps,rs);
            }
            return null;
    
        }
        public <T>T getForInstance(Class<T> clazz,String sql,Object ...args) {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = JDBCUtils.getConnection();
                ps = conn.prepareStatement(sql);
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
                rs = ps.executeQuery();
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                if(rs.next()){
                    T t = clazz.newInstance();
                    for(int i=0;i<columnCount;i++){
                        Object value = rs.getObject(i + 1);
                        String columnLabel = rsmd.getColumnLabel(i + 1);
                        Field field = clazz.getDeclaredField(columnLabel);
                        field.setAccessible(true);
                        field.set(t,value);
                    }
                    return t;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                JDBCUtils.closeResource(conn,ps,rs);
            }
            return null;
        }
    ```

- 两种思想

  - 面向接口编程的思想

  - ORM思想(object relational mapping)
    - 一个数据表对应一个java类
    - 表中的一条记录对应java类的一个对象
    - 表中的一个字段对应java类的一个属性

  > sql是需要结合列名和表的属性名来写。注意起别名。

- 两种技术

  - JDBC结果集的元数据：ResultSetMetaData
    - 获取列数：getColumnCount()
    - 获取列的别名：getColumnLabel()
  - 通过反射，创建指定类的对象，获取指定的属性并赋值

- 过程图示

![image-20220512170224429](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220512170224429.png)



- 查询操作的流程

![image-20220519164815890](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220519164815890.png)

 

### 五、操作Blob类型的变量

- 具体的insert

  - ```java
    /**
        *
        *@author Kong
        *@Description 向数据表中插入blob信息
        *@Date 13:59 2022/5/20
        *@Param
        *@Return
        **/
        @Test
        public void testInsert() throws Exception {
    
            Connection conn = JDBCUtils.getConnection();
            String sql = "insert into customers(name,email,birth,photo) values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setObject(1, "孙悟空");
            ps.setObject(2, "sun@qq.com");
            ps.setObject(3, "500-01-01");
    
            FileInputStream is = new FileInputStream(new File("src/sun.jpg"));
    
            ps.setBlob(4, is);
            ps.execute();
            JDBCUtils.closeResource(conn,ps);
        }
    ```

- 具体的查询

  - ```java
    /**
        *
        *@author Kong
        *@Description 从数据表中查询blob信息
        *@Date 14:00 2022/5/20
        *@Param
        *@Return
        **/
        @Test
        public  void testQuery() throws Exception {
            Connection conn = null;
            PreparedStatement ps = null;
            InputStream is=null;
            FileOutputStream fos=null;
            try {
                conn = JDBCUtils.getConnection();
    
                String sql = "select id,name,email,birth,photo from customers  where id =?" ;
                ps = conn.prepareStatement(sql);
                ps.setObject(1, 20);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
        //            方式一
        //            int id = rs.getInt(1);
        //            String name = rs.getString(2);
        //            String email = rs.getString(3);
        //            Date birth = rs.getDate(4);
        //            方式二：更易读，不易出错
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    Date birth = rs.getDate("birth");
                    Customer customer = new Customer(id, name, email, birth);
                    System.out.println(customer);
        //          将文件下载到本地
                    Blob photo = rs.getBlob("photo");
                    is = photo.getBinaryStream();
                    fos = new FileOutputStream("wukong.jpg");
                    byte[] bytes = new byte[1024];
                    int len;
                    while((len=is.read(bytes))!=-1){
                        fos.write(bytes,0,len);
                }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
    
                JDBCUtils.closeResource(conn,ps);
                is.close();
                fos.close();
            }
    
        }
    ```

    

### 六、批量插入

- 层次一：使用statement实现
- 层次二：使用preparestatement实现
- 层次三：
  - 修改1： 使用 addBatch() / executeBatch() / clearBatch()
  - 修改2：mysql服务器默认是关闭批处理的，我们需要通过一个参数，让mysql开启批处理的支持。?rewriteBatchedStatements=true 写在配置文件的url后面
  - 修改3：使用更新的mysql 驱动：mysql-connector-java-5.1.37-bin.jar

- 层次四：
  - 在层次三的基础上操作使用Connection 的 setAutoCommit(false)  /  commit()

最终代码

```java
//    方式四 :设置不允许自动提交数据
    @Test
    public void testInsert3() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            long start = System.currentTimeMillis();
            conn = JDBCUtils.getConnection();
//            设置不自动提交数据
            conn.setAutoCommit(false);
            String sql = "insert into goods(name) values(?)";
            ps = conn.prepareStatement(sql);
            for(int i=1;i<=20000;i++){
                ps.setObject(1,"name_"+i);
//                攒batch
                ps.addBatch();
                if(i%500==0){
//                    执行batch
                    ps.executeBatch();
//                    清空batch
                    ps.clearBatch();
                }
            }
//            提交数据
            conn.commit();
            long end = System.currentTimeMillis();
            System.out.println("时间为："+(end-start)); //13174
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(conn,ps);
        }

    }
```

#### 面试题：Preparestatement和statement的异同

- 接口与子接口的关系
- 开发中多数使用前者
- 代码的可读性和可维护性。
- **PreparedStatement 能最大可能提高性能：**
  - DBServer会对**预编译**语句提供性能优化。因为预编译语句有可能被重复调用，所以<u>语句在被DBServer的编译器编译后的执行代码被缓存下来，那么下次调用时只要是相同的预编译语句就不需要编译，只要将参数直接传入编译过的语句执行代码中就会得到执行。</u>
  - 在statement语句中,即使是相同操作但因为数据内容不一样,所以整个语句本身不能匹配,没有缓存语句的意义.事实是没有数据库会对普通语句编译后的执行代码缓存。这样<u>每执行一次都要对传入的语句编译一次。</u>
  - (语法检查，语义检查，翻译成二进制命令，缓存)

- PreparedStatement 可以防止 SQL 注入 

### 七、事务

#### 事务简介

- **事务：一组逻辑操作单元,使数据从一种状态变换到另一种状态。**

- **事务处理（事务操作）的原则：**保证所有事务都作为一个工作单元来执行，即使出现了故障，都不能改变这种执行方式。当在一个事务中执行多个操作时，要么所有的事务都**被提交(commit)**，那么这些修改就永久地保存下来；要么数据库管理系统将放弃所作的所有修改，整个事务**回滚(rollback)**到最初状态。

- 避免数据自动提交

  - 执行DML语句会自动提交
    - 设置autocommit无效
    
    - 执行DDL语句也会自动提交
      - 需要设置autocommit为false
  
- 数据库连接关闭也会自动提交


- 事物的ACID属性

  - 多数的只解决了脏读问题就解决了

  - mysql支持四种隔离级别，Oracle只支持两种

  - 一般情况保证 read commit就可以

- 代码体现

  - ```java
    @Test
        public void testUpdateTx() {
            Connection conn = null;
            try {
                conn = JDBCUtils.getConnection();
    //        取消自动提交
                conn.setAutoCommit(false);
                String sql1="update user_table set balance=balance-100 where user=?";
                update(conn,sql1,"AA");
    //        模拟错误
    //            System.out.println(1/0);
    
                String sql2="update user_table set balance=balance+100 where user=?";
                update(conn,sql2,"BB");
                System.out.println("成功");
                conn.commit();
            } catch (Exception e) {
                e.printStackTrace();
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    e.printStackTrace();
                }
            } finally {
    //            恢复默认值，在设置数据库连接池时使用
                try {
                    conn.setAutoCommit(true);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                JDBCUtils.closeResource(conn,null);
            }
        }
    ```

- 使用事务后的增删改（V2.0）

  - ```java
    //    通用的增删改操作 v2.0（考虑到事务）
    public int update(Connection conn,String sql,Object ...args) {
        PreparedStatement ps = null;
        try {
    //        占位符的个数等于可变形参的个数
            ps = conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
    //            方式一：如果执行的查询操作又返回结果，此方法返回true；执行增删改，无返回结果，返回false
    //            ps.execute();
    //            方式二：
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(null,ps);
        }
        return 0;
    
    }
    ```

- 使用事务后的查询（V2.0）

  - 略

#### 事物的四大属性

1. **原子性（Atomicity）**
   原子性是指事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生。 

2. **一致性（Consistency）**
   事务必须使数据库从一个一致性状态变换到另外一个一致性状态。

3. **隔离性（Isolation）**
   事务的隔离性是指一个事务的执行不能被其他事务干扰，即一个事务内部的操作及使用的数据对并发的其他事务是隔离的，并发执行的各个事务之间不能互相干扰。

4. **持久性（Durability）**
   持久性是指一个事务一旦被提交，它对数据库中数据的改变就是永久性的，接下来的其他操作和数据库故障不应该对其有任何影响。

#### 数据库的并发问题

- 对于同时运行的多个事务, 当这些事务访问数据库中相同的数据时, 如果没有采取必要的隔离机制, 就会导致各种并发问题:

  - **脏读**: 对于两个事务 T1, T2, T1 读取了已经被 T2 更新但还**没有被提交**的字段。之后, 若 T2 回滚, T1读取的内容就是临时且无效的。

  - **不可重复读**: 对于两个事务T1, T2, T1 读取了一个字段, 然后 T2 **更新**了该字段。之后, T1再次读取同一个字段, 值就不同了。

  - **幻读**: 对于两个事务T1, T2, T1 从一个表中读取了一个字段, 然后 T2 在该表中**插入**了一些新的行。之后, 如果 T1 再次读取同一个表, 就会多出几行。

#### 四种隔离级别（隔离性越好，并发性越差）

![image-20220525180458502](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220525180458502.png)

查看并设置隔离级别

### 八、DAO

#### BaseDAO.java

```java
package dao2;

/**
 * 功能描述 通用的数据库操作
 *
 * @author Kong
 * @date 2022/05/23  14:17
 */
public abstract class BaseDAO<T> {
    private Class<T> clazz=null;

    {//此处为子类调用，正常声明在子类更好理解，但是为了避免新添加类就要重复写这段代码，所以放在父类中，在调用时，比如customerDAO类调用，此处的this指的是customerDAO类的对象
//        获取当前BaseDAO的子类继承的父类（即为BaseDAO）的泛型
        Type genericSuperclass = this.getClass().getGenericSuperclass();
        ParameterizedType paramType= (ParameterizedType) genericSuperclass;

        Type[] types = paramType.getActualTypeArguments();//获取父类的泛型
        clazz = (Class<T>) types[0];//泛型的第一个参数
    }

    //    通用的增删改操作 v2.0（考虑到事务）
    public int update(Connection conn, String sql, Object ...args) {
        PreparedStatement ps = null;
        try {
//        占位符的个数等于可变形参的个数
            ps = conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
//            方式一：如果执行的查询操作又返回结果，此方法返回true；执行增删改，无返回结果，返回false
//            ps.execute();
//            方式二：
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(null,ps);
        }
        return 0;

    }

    /**
     *
     *@author Kong
     *@Description 针对不同表的通用查询操作，返回表中的一条记录
     *@Date 22:06 2022/5/19
     *@Param
     *@Return
     **/
    public T getForInstance(Connection conn,String sql,Object ...args) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            if(rs.next()){
                T t = clazz.newInstance();
                for(int i=0;i<columnCount;i++){
                    Object value = rs.getObject(i + 1);
                    String columnLabel = rsmd.getColumnLabel(i + 1);
                    Field field = clazz.getDeclaredField(columnLabel);
                    field.setAccessible(true);
                    field.set(t,value);
                }
                return t;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(null,ps,rs);
        }
        return null;
    }

    /**
     *
     *@author Kong
     *@Description 针对不同表的通用查询操作，返回表中的一组记录
     *@Date 22:12 2022/5/19
     *@Param
     *@Return
     **/
    public  List<T> getForList(Connection conn,  String sql, Object ...args){
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            ArrayList<T> list = new ArrayList<>();
            while(rs.next()){
                T t = clazz.newInstance();
                for(int i=0;i<columnCount;i++){
                    Object value = rs.getObject(i + 1);
                    String columnLabel = rsmd.getColumnLabel(i + 1);
                    Field field = clazz.getDeclaredField(columnLabel);
                    field.setAccessible(true);
                    field.set(t,value);
                }
                list.add(t);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(null,ps,rs);
        }
        return null;

    }
//    查找特殊值的方法
    public <E>E getValue(Connection conn,String sql,Object ...args)  {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = conn.prepareStatement(sql);
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }
            rs = ps.executeQuery();
            if(rs.next()){
                 return (E) rs.getObject(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.closeResource(null,ps,rs);
        }
        return null;


    }
}

```



#### CustomerDAO

```java
package dao2;

/**
 * 功能描述
 *
 * @author Kong
 * @date 2022/05/23  14:35
 */
public interface CustomerDAO {
    /**
    *
    *@author Kong
    *@Description 插入指定数据
    *@Date 14:35 2022/5/23
    *@Param
    *@Return
    **/
    void insert(Connection conn, Customer cust);

    /**
    *
    *@author Kong
    *@Description 更新用户数据
    *@Date 14:36 2022/5/23
    *@Param
    *@Return
    **/

    void update(Connection conn,Customer cust);
    /**
    *
    *@author Kong
    *@Description 根据id删除指定用户
    *@Date 14:37 2022/5/23
    *@Param
    *@Return
    **/
    void deleteById(Connection conn,int id);

    /**
    *
    *@author Kong
    *@Description 根据ID获得对应的customer对象
    *@Date 14:38 2022/5/23
    *@Param
    *@Return
    **/
    Customer getCustomerById(Connection conn,int id);

    /**
    *
    *@author Kong
    *@Description 获取所有记录构成的记录
    *@Date 14:40 2022/5/23
    *@Param
    *@Return
    **/
    List<Customer> getAll(Connection conn);


    /**
    *
    *@author Kong
    *@Description 返回数据表中数据的条目数量
    *@Date 14:42 2022/5/23
    *@Param
    *@Return
    **/
    long getCount(Connection conn);
    /**
    *
    *@author Kong
    *@Description 获取数据库表中最大的生日
    *@Date 14:43 2022/5/23
    *@Param
    *@Return
    **/

    Date getMaxBirth(Connection conn);

}

```

#### CuscomerDAOImpl

```java
package dao2;

/**
 * 功能描述
 *
 * @author Kong
 * @date 2022/05/23  14:45
 */
public class CustomerDAOImpl extends BaseDAO<Customer> implements CustomerDAO {

    @Override
    public void insert(Connection conn, Customer cust) {
        String sql="insert into customers(name,email,birth) values(?,?,?)";
        update(conn,sql,cust.getName(),cust.getEmail(),cust.getBirth());

    }

    @Override
    public void update(Connection conn, Customer cust) {
        String sql="update customers set name=?,email=?,birth=? where id=?";
        update(conn,sql,cust.getName(),cust.getEmail(),cust.getBirth(),cust.getId());
    }

    @Override
    public void deleteById(Connection conn, int id) {
        String sql="delete from customers where id = ?";
        update(conn,sql,id);
    }

    @Override
    public Customer getCustomerById(Connection conn, int id) {
        String sql="select id,name,email,birth from customers where id =?";
        Customer customer = getForInstance(conn,  sql, id);
        return customer;
    }

    @Override
    public List<Customer> getAll(Connection conn) {
        String sql="select id,name,email,birth   from customers";
        List<Customer> list = getForList(conn,  sql);
        return list;
    }

    @Override
    public long getCount(Connection conn) {
        String sql="select count(*) from customers";
        return getValue(conn,sql);
    }

    @Override
    public Date getMaxBirth(Connection conn) {
        String sql="select max(birth) from customers";
        return getValue(conn, sql);
    }
}

```

#### 小结

![image-20220525182248752](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220525182248752.png)

### 九、数据库连接池

必要性

![image-20220523195426832](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220523195426832.png)

几种连接池

![image-20220523195941820](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220523195941820.png)

#### **数据库连接池技术的优点**

**1. 资源重用**

由于数据库连接得以重用，避免了频繁创建，释放连接引起的大量性能开销。在减少系统消耗的基础上，另一方面也增加了系统运行环境的平稳性。

**2. 更快的系统反应速度**

数据库连接池在初始化过程中，往往已经创建了若干数据库连接置于连接池中备用。此时连接的初始化工作均已完成。对于业务请求处理而言，直接利用现有可用连接，避免了数据库连接初始化和释放过程的时间开销，从而减少了系统的响应时间

**3. 新的资源分配手段**

对于多应用共享同一数据库的系统而言，可在应用层通过数据库连接池的配置，实现某一应用最大可用数据库连接数的限制，避免某一应用独占所有的数据库资源

**4. 统一的连接管理，避免数据库连接泄漏**

在较为完善的数据库连接池实现中，可根据预先的占用超时设定，强制回收被占用连接，从而避免了常规数据库连接操作中可能出现的资源泄露

#### 几种连接池的使用

### 十、dbutils的使用

