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
    var coursesArr: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func fetchData () {
        let dataQuery = BackendlessDataQuery()
        let backendless = Backendless()
        var error: Fault?
        let bc = backendless.data.of(Course.ofClass()).find(dataQuery, fault: &error)

        if error == nil {
            if coursesArr.count > 0 {
                coursesArr.removeAllObjects()
            }

            for course in bc.data {
                coursesArr.addObject(course)
            }
            self.tableView.reloadData()
        }
        else {
            print("Server reported an error: \(error)")
        }
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
        return coursesArr.count

    }

    func numberOfSectionsInTableView(tableview: UITableView) -> Int {
        return 1
    }

}
