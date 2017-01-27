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
    
    var movies = [Movie]()
    
    class func fetchMovies (movieTitle: String, completion: @escaping ([String:AnyObject]) -> Void) {
        
        let movieTitleWithPlus = movieTitle.replacingOccurrences(of: " ", with: "+")
        let URLString = URL(string: "http://www.omdbapi.com/?t=\(movieTitleWithPlus)&y=&plot=short&r=json")
//        let URLString = URL(string: "http://www.omdbapi.com/?t=lion+king&y=&plot=short&r=json")
        
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
                
                
            } catch let jsonError {
                print (jsonError)
            }
            
        }.resume()
    }

}
//    func fetchVideos() {
//        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            
//            if error != nil {
//                print(error)
//                return
//            }
//            
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                
//                self.videos = [Video]()
//                
//                for dictionary in json as! [[String: AnyObject]] {
//                    
//                    let video = Video()
//                    video.title = dictionary["title"] as? String
//                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
//                    
//                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
//                    
//                    let channel = Channel()
//                    channel.name = channelDictionary["name"] as? String
//                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
//                    
//                    video.channel = channel
//                    
//                    self.videos?.append(video)
//                }
//                
//                DispatchQueue.main.async(execute: {
//                    self.collectionView?.reloadData()
//                })
//                
//            } catch let jsonError {
//                print(jsonError)
//            }
//            
//            
//            
//        }) .resume()
