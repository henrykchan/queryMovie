//
//  DetailViewController.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/11/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contentView: UIView!
    let infoTableView = UITableView()
    let backgroundPosterImage = UIImageView()
    let smallPosterImage = UIImageView()
    let titleLabel = UILabel()
    let ratingLabel = UILabel()
    let blurredOverlay = UIView()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hello", for: indexPath)
        
        return cell
    }
    
    


    

    

}
