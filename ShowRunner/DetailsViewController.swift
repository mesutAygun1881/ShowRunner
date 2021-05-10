//
//  DetailsViewController.swift
//  ShowRunner
//
//  Created by Mesut Aygün on 9.05.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageLabel: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var networkLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    var show : Show!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard show != nil else {
            print("show is nil")
            return
        }
        
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = show.name
        languageLabel.text = show.language ?? ""
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "",options: .regularExpression,range: nil)
        descriptionTextView.text = show.summary ?? ""
        networkLabel.text = show.network?.name ?? ""
        if let rating = show.rating?.average {
            ratingLabel.text = "\(rating)"
        }else {
            ratingLabel.text = "-"
        }
        var genreList = ""
        if show.genres != nil {
            for genre in show.genres! {
                genreList += "\(genre)\n"
            }
            if genreList != "" {
                genreList.removeLast()
            }
        }
        genresLabel.text = genreList
        
        guard let url = URL(string: show.image?.original ?? "") else {return}
        do {
            let data = try Data(contentsOf: url)
            imageLabel.image = UIImage(data: data)
        }
            catch{
                print("error\(url)")
                
                
            }
        }
        
        
    }
    

 

