//
//  extensions.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/17/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

extension UIColor {
    
}
extension MainViewController {
    
    func setupNavigationBarItems() {
//        setupLeftNavItems()
//        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "cactus"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 50 , height: 50)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = UIColor.blue
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    private func setupLeftNavItems() {
       
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysTemplate), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        searchButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchButton)
        searchButton.contentMode = .scaleAspectFit
        
    }
    
    private func setupRightNavItems() {
        

        let addButton = UIButton(type: .system)
        addButton.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        addButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.contentMode = .scaleAspectFit
        
    }
    
}

// Caching
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        let url = URL(string: urlString)!
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data!)
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
        }.resume()
    }
}

extension UIColor {
    
}



