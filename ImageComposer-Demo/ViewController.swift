//
//  ViewController.swift
//  ImageComposer-Demo
//
//  Created by huangluyang on 15/10/22.
//  Copyright © 2015年 Luyang Huang. All rights reserved.
//

import UIKit
import ImageComposer

class ViewController: UITableViewController {
    
    lazy var datas: [AnyObject] = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupDataSources()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupDataSources() {
        var images: [UIImage] = [UIImage]()
        for i in 1...9 {
            let image = UIImage(named: "\(i)")!
            images += [image]
            self.datas += [images]
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(UITableViewCell), forIndexPath: indexPath)
        let images = self.datas[indexPath.row]
        if let image = ImageComposer.composedImage(images as! [UIImage], destinationSize: CGSizeMake(50, 50)) {
            cell.imageView?.image = image
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}
