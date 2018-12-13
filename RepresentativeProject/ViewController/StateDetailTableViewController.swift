//
//  StateDetailTableViewController.swift
//  RepresentativeProject
//
//  Created by Brady Bentley on 12/13/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    var representatives: [Representative]  = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var state: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else { return }
        RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
            self.representatives = representatives
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepresentativeCell", for: indexPath) as! RepresentativeTableViewCell
        let representative = self.representatives[indexPath.row]
        cell.representative = representative
        return cell
    }

}
