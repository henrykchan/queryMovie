//
//  APIClient.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/26/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import Foundation
import UIKit

class movieAPIClient {
    
    
    class func fetchMovies (movieTitle: String, completion: @escaping ([String:AnyObject]) -> Void) {
        
        let movieTitleWithPlus = movieTitle.replacingOccurrences(of: " ", with: "+")
        let URLString = URL(string: "http://www.omdbapi.com/?t=\(movieTitleWithPlus)&y=&plot=short&r=json")

        
        guard let unwrappedURL = URLString else {return}
        
        URLSession.shared.dataTask(with: unwrappedURL) { (data, response, error) in
            
            if error != nil {
                print(error ?? print("error"))
                return
            }
            
            
            guard let unwrappedData = data else {return}
            do {
                
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as! [String:AnyObject]
                
                completion(json)
                print(json)
                
                
            }
            
            
            
            catch let jsonError {
                print (jsonError)
            }
            
        }.resume()
    }

}

