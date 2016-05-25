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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func fetchingFirstPageAsync() {

        let startTime = NSDate()
        let query = BackendlessDataQuery()
        let backendless = Backendless()

        backendless.persistenceService.of(Course.ofClass()).find(
            query,
            response: { ( courses : BackendlessCollection!) -> () in
                let currentPage = courses.getCurrentPage()

                for course in currentPage as! [Course] {
                    print("Course name = \(course.name)")
                    self.coursesArr.addObject(course)
                }

                print("Total time (ms) - \(1000*NSDate().timeIntervalSinceDate(startTime))")
            },
            error: { ( fault : Fault!) -> () in
                print("Server reported an error: \(fault)")
            }
        )
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

}
