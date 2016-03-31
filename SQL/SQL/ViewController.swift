//
//  ViewController.swift
//  SQL
//
//  Created by czljcb on 16/3/21.
//  Copyright © 2016年 lQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        SQLTool.shareSQLTool.createTable()
        SQLTool.shareSQLTool.insertWithStmt()
        SQLTool.shareSQLTool.queryAllText()

//        let begin = CFAbsoluteTimeGetCurrent()
//        SQLTool.shareSQLTool.beginTransaction()
//        for _ in 0..<10000{
//        
//            //SQLTool.shareSQLTool.insertInto()//9.88920700550079 0.750365018844604
//            SQLTool.shareSQLTool.insertWithStmt() //5.41968899965286 0.0770189762115479
//        }
//        SQLTool.shareSQLTool.commitTransaction()
//        let end = CFAbsoluteTimeGetCurrent()
//
//        print(end - begin)
    }
    


}

