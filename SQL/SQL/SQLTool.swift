//
//  SQLTool.swift
//  SQL
//
//  Created by czljcb on 16/3/21.
//  Copyright © 2016年 lQ. All rights reserved.
//

import Foundation

class SQLTool: NSObject {
    
    let SQLITE_STATIC = unsafeBitCast(0, sqlite3_destructor_type.self)
    let SQLITE_TRANSIENT = unsafeBitCast(-1, sqlite3_destructor_type.self)
    
    
    // MARK: - 文件路径
    let filePath = "/Users/czljcb/Desktop/04-数据存储.sqlite"
    // MARK: - 单例属性
    static let shareSQLTool = SQLTool()
    // MARK: - 数据库属性
    var db:COpaquePointer = nil
    
    
    func beginTransaction()
    {
        let sql = "BEGIN TRANSACTION"
        sqlite3_exec(db, sql, nil, nil, nil)
    }
    func commitTransaction()
    {
        let sql = "COMMIT TRANSACTION"
        sqlite3_exec(db, sql, nil, nil, nil)
    }
    
}

// MARK: - DDL
extension SQLTool{
    
    // MARK: - 删除所有记录
    func drop() -> Bool{
        let sql = "DROP TABLE IF EXISTS t_data"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("DROP失败")
            return true
        }else
        {
            print("DROP成功")
            return !true
            
        }
        
    }
    
    // MARK: - 重命名table
    func reName() -> Bool{
        let sql = "ALTER TABLE t_data RENAME TO t_newData;"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("reName失败")
            return !true
        }else
        {
            print("reName成功")
            return true
        }
        
    }
    
    // MARK: - 打开数据库
    private func openDB() -> Bool{
        if sqlite3_open(filePath, &db) == SQLITE_OK
        {
            print("打开数据库成功")
            return true
        }
        else{
            print("打开数据库失败")
            return !true
        }
        
    }
    
    // MARK: - 创建数据库表
    func createTable() -> Bool{
        
        if openDB() == !true
        {
            return !true
        }
        let sql = "create table if not EXISTS t_data(id integer PRIMARY KEY AUTOINCREMENT, name text, age inetger , info text);"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("创建表失败")
            return true
            
        }else
        {
            print("创建表成功")
            return !true
        }
    }
    
}

// MARK: - DML
extension SQLTool{
    
    
    func insertWithStmt()
    {
        
        let sqlStr = "insert into t_data(name, age,info) values (?, ?, ?)"
        
        // 1. 创建一个预处理语句
        
        // 参数1: 已经打开的数据
        // 参数2: 需要预处理的语句
        // 参数3: 参数2的长度 -1. 就代表,会自动计算 \n
        // 参数4: 需要我们拿到的"预处理语句对象"
        // 参数5: 如果参数2, 没有取完, 剩下的字符串就保存在这个参数里面
        var stmt: COpaquePointer = nil
        if sqlite3_prepare_v2(db, sqlStr, -1, &stmt, nil) != SQLITE_OK
        {
            print("预处理语句失败")
            
            return
        }
        
        // 2. 绑定参数
        // 参数1: 预处理语句
        // 参数2: 需要绑定的参数索引  从1, 开始
        // 参数3: 需要绑定的值
        // 参数4: 参数3的长度
        // 参数5: 处理参数3的方式, 是一个指向函数的指针, 其实系统提供的有两个值 SQLITE_STATIC, SQLITE_TRANSIENT
        // SQLITE_STATIC : 函数的作用就是  认为参数3 是一个静态的值, 不会被释放, 所以, 没有引用
        // SQLITE_TRANSIENT : 函数的作用就是  会自动的拷贝一份参数3副本,
        
        sqlite3_bind_text(stmt, 1, "czljcb", -1, SQLITE_TRANSIENT)
        
        sqlite3_bind_double(stmt, 2, 88)
        
        //let data = NSKeyedArchiver.archivedDataWithRootObject(["name":"曹志"])
        guard let data = try? NSJSONSerialization.dataWithJSONObject(["name":"曹志"], options: NSJSONWritingOptions.PrettyPrinted) else
        {
            return
        }

        let infoData = String(data: data, encoding: NSUTF8StringEncoding)
        sqlite3_bind_text(stmt, 3, infoData! , -1, SQLITE_TRANSIENT)

        
        //let data = NSKeyedArchiver.archivedDataWithRootObject(["name":"曹志"])
        //sqlite3_bind_blob(stmt, 3, data.bytes,Int32(data.length), nil);
        
        // 3. 执行预处理语句
        sqlite3_step(stmt) == SQLITE_DONE
        //        {
        //            print("执行成功")
        //        }
        
        // 4. 重置语句
        //        sqlite3_reset(stmt)
        
        // 5. 释放资源
        sqlite3_finalize(stmt)
        
    }
    
    // MARK: - 插入数据
    func insertInto() -> Bool{
        
        let sql = "insert into t_data(name,age)  values('czljcb',24 );"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("inset into 失败")
            return !true
        }else
        {
            print("insert into 成功")
            return true
        }
        
    }
    
    // MARK: - 更新数据
    func update() -> Bool{
        let sql = "update t_data set name = '曹志' where id = 5;"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("update 失败")
            return !true
        }else
        {
            print("update 成功")
            return true
        }
    }
    
    // MARK: - 删除记录数据
    func delete() -> Bool{
        let sql = "DELETE from t_data WHERE id = 5;"
        
        if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK{
            print("delete 失败")
            return !true
        }else
        {
            print("delete 成功")
            return true
        }
    }
    
    
    
}

// MARK: - DQL
extension SQLTool{
    
    // MARK: - 查询记录数据
    
    func queryAll() -> [[String : AnyObject]?]?{
        let sql = "select * from t_data;"
        var stmt:COpaquePointer = nil;
        
        
        let result = sqlite3_prepare_v2(db,sql, -1, &stmt, nil);
        var allStudentArray:[[String : AnyObject]?] = [[String : AnyObject]?]();
        
        if (result==SQLITE_OK)
        {
            
            //开始搜索
            
            //SQLITE_ROW= sqlite3_step() has another row ready
            //SQLITE_ROW只要数据库里面还有下一行，就会自动循环
            while SQLITE_ROW==sqlite3_step(stmt)
            {
                let ID = sqlite3_column_int(stmt, 0);
                let name = sqlite3_column_text(stmt, 1);
                let age = sqlite3_column_int(stmt, 2);
                
                let nameStr = String(CString: UnsafePointer<CChar>(name), encoding: NSUTF8StringEncoding)
                
                
                let bytes = sqlite3_column_blob(stmt, 3);
                let length = sqlite3_column_bytes(stmt, 3);
                let data = NSData(bytes: bytes, length: Int(length))
                
                let dataDict = NSKeyedUnarchiver.unarchiveObjectWithData(data)
                
                if dataDict == nil {
                    return [nil]
                }
                
                allStudentArray.append((dataDict as! [String : AnyObject]?)!)
                
                print("id == \(ID) , name == \(nameStr!) , age == \(age) , info == \(dataDict!)" )
            }
        }
        return allStudentArray;
        
    }
    
    
    func queryAllText() -> [[String : AnyObject]?]?{
        let sql = "select * from t_data;"
        var stmt:COpaquePointer = nil;
        
        
        let result = sqlite3_prepare_v2(db,sql, -1, &stmt, nil);
        var allStudentArray:[[String : AnyObject]?] = [[String : AnyObject]?]();
        
        if (result==SQLITE_OK)
        {
            
            //开始搜索
            
            //SQLITE_ROW= sqlite3_step() has another row ready
            //SQLITE_ROW只要数据库里面还有下一行，就会自动循环
            while SQLITE_ROW==sqlite3_step(stmt)
            {
                let ID = sqlite3_column_int(stmt, 0);
                let name = sqlite3_column_text(stmt, 1);
                let age = sqlite3_column_int(stmt, 2);
                let info = sqlite3_column_text(stmt, 3);

                
                let nameStr = String(CString: UnsafePointer<CChar>(name), encoding: NSUTF8StringEncoding)
                let infoStr = String(CString: UnsafePointer<CChar>(info), encoding: NSUTF8StringEncoding)

                
                
                let data = infoStr?.dataUsingEncoding(NSUTF8StringEncoding)
                

                // 2.2.2将微博字符串转换为微博字典
                let dataDict = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject]  as [String : AnyObject]?

            
                allStudentArray.append((dataDict )!)
                
                print("id == \(ID) , name == \(nameStr!) , age == \(age) , info == \(dataDict!)" )
            }
        }
        return allStudentArray;
        
    }
    
}