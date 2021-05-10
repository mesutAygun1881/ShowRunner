//
//  ViewController.swift
//  ShowRunner
//
//  Created by Mesut Aygün on 9.05.2021.
//

import UIKit

class ListViewController: UIViewController {
    var shows = Shows()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentLabel: UISegmentedControl!
    var searchText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        shows.urlString += searchText
        shows.getData{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue : UIStoryboardSegue , sender : Any?) {
        let destination = segue.destination as! DetailsViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        destination.show = shows.showArray[selectedIndexPath.row].show
    }
    
    
    func sortTable() {
        switch segmentLabel.selectedSegmentIndex {
        case 0:
            shows.showArray.sort(by: {$0.show.name < $1.show.name})
        case 1:
            shows.showArray.sort(by: {$0.show.rating?.average ?? 0.0 > $1.show.rating?.average ?? 0.0})
        default:
            print("")
        }
        tableView.reloadData()
    }

    @IBAction func segmentButton(_ sender: UISegmentedControl) {
    
    sortTable()
    }
}

extension ListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.showArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shows.showArray[indexPath.row].show.name
        
        if let rating = shows.showArray[indexPath.row].show.rating?.average {
            cell.detailTextLabel?.text = "\(rating)"
        }else {
            cell.detailTextLabel?.text = "-"
        }
        return cell
    }
}

