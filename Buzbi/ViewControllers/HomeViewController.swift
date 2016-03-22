//
//  HomeViewController.swift
//  Buzbi
//
//  Created by Crowson, John on 3/21/16.
//  Copyright © 2016 Crowson, John. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let kCellHeight:CGFloat = 60.0
    var sampleTableView:UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sampleTableView = UITableView(frame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height), style:.Grouped)
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
        sampleTableView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        sampleTableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(sampleTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        self.sampleTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let CellIdentifierPortrait = "CellPortrait";
        let CellIdentifierLandscape = "CellLandscape";
        let indentifier = self.view.frame.width > self.view.frame.height ? CellIdentifierLandscape : CellIdentifierPortrait
        var cell = tableView.dequeueReusableCellWithIdentifier(indentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: indentifier)
            cell?.selectionStyle = .None
            
            if indexPath.row == 0{
                let headerImageRect:CGRect = CGRect(x: 0, y: 0, width: 450, height: 150)
                let headerSubView:UIView = UIView(frame: headerImageRect)
                headerSubView.backgroundColor = UIColor.yellowColor()
                //let headerImage:UIImage = UIImage(named: "comb.jpg")!
                //let headerImageView:UIImageView = UIImageView(image: headerImage)
                //headerSubView.addSubview(headerImageView)
                cell?.contentView.addSubview(headerSubView)
                return cell!
            }
            else{
                let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRectMake(0, 0, tableView.frame.size.width, kCellHeight))
                if indexPath.row == 1{
                    horizontalScrollView.miniAppearPxOfLastItem = 10
                    horizontalScrollView.uniformItemSize = CGSizeMake(50, 50)
                    //this must be called after changing any size or margin property of this class to get acurrate margin
                    horizontalScrollView.setItemsMarginOnce()
                    for _ in 1...20{
                        let button = UIButton(frame: CGRectZero)
                        button.backgroundColor = UIColor.blueColor()
                        horizontalScrollView.addItem(button)
                    }
                }
                else if indexPath.row == 2 {
                    horizontalScrollView.miniAppearPxOfLastItem = 30
                    horizontalScrollView.uniformItemSize = CGSizeMake(80, 50)
                    //this must be called after changing any size or margin property of this class to get acurrate margin
                    horizontalScrollView.setItemsMarginOnce()
                    for _ in 1...20{
                        let button = UIButton(frame: CGRectZero)
                        button.backgroundColor = UIColor.purpleColor()
                        horizontalScrollView.addItem(button)
                    }
                }
                cell?.contentView.addSubview(horizontalScrollView)
                horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
                cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: kCellHeight))
                cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: cell!.contentView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
            }
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return CGFloat(150);
        }
        return kCellHeight
    }
    
}

