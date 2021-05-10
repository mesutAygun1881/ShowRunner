//
//  DetailViewController.swift
//  ShowRunner
//
//  Created by Mesut Aygün on 9.05.2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var searchShowLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButtonLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchTextField.text!
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let destination = segue.destination as! ListViewController
        destination.searchText = searchText
    }
    

}
