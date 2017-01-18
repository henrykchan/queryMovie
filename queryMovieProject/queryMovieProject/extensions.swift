//
//  extensions.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/17/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func setupNavigationBarItems() {
        setupLeftNavItems()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "cactus"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.backgroundColor = UIColor.blue
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
    private func setupLeftNavItems() {
       
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchButton)
    }
    
    private func setupRightNavItems() {
        
        let addButton = UIButton(type: .system)
        addButton.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }

}
