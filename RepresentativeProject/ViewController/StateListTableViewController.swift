//
//  StateListTableViewController.swift
//  RepresentativeProject
//
//  Created by Brady Bentley on 12/13/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    // MARK: - Properties
    

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.allStates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        let state = States.allStates[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        if segue.identifier == "ToRepresentativesDetail"{
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as? StateDetailTableViewController
            let state = States.allStates[indexPath.row]
            destinationVC?.state = state
        }
    }
}
