//
//  MainViewController.swift
//  kursu
//
//  Created by Daniel Hansson on 19/05/16.
//  Copyright © 2016 PanamaDonne. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension MainViewController: UITableViewDelegate {



}

extension MainViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! MainViewTableViewCell

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSectionsInTableView(tableview: UITableView) -> Int {
        return 1
    }

    func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat {
        return 80
    }


}
