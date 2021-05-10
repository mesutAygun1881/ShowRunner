//
//  ShowModelandService.swift
//  ShowRunner
//
//  Created by Mesut Aygün on 9.05.2021.
//

import Foundation

class Shows {
    
    struct Returned : Codable {
//        var score : Double
        var show : Show
    }
   
    var urlString = "https://api.tvmaze.com/search/shows?q="
    var showArray : [Returned] = []
    func getData(completed : @escaping () ->()) {
        print("url accessing \(urlString)")
        
        guard let url = URL(string: urlString) else {
            
            print("error:\(urlString)")
            completed()
            return
            
        }
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error : \(error)")
            }
            
            do {
                self.showArray = try JSONDecoder().decode([Returned].self, from: data!)
                print("returned : \(self.showArray)")
                
            }catch{
                print("json error: \(error.localizedDescription)")
                
            }
            completed()
        }
        
        task.resume()
    }
}
