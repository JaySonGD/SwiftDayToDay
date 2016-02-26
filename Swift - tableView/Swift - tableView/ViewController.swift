//
//  ViewController.swift
//  Swift - tableView
//
//  Created by czljcb on 16/2/26.
//  Copyright © 2016年 czljcb. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    // ********************************************************************************************************
    // MARK: - < life cyle >
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.backgroundColor = UIColor.redColor()
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // ********************************************************************************************************
    // MARK: - < UITableViewDataSource >


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = "---\(indexPath.row)"
        
        return cell!
    }
    
    // ********************************************************************************************************
    // MARK: - < UITableViewDelegate >
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        print("\(indexPath.row)")
        
    }

    
    

}

