//
//  ViewController.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/3/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    var movies: [Movie]?
    var mainCollectionView: UICollectionView!
    var searchController = UISearchController(searchResultsController: nil)
    var searchBarContainerView = UIView()
    var randomString: String = ""
    
    //maybe delete
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Navigation Controller
//        let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action)) // action:#selector(Class.MethodName) for swift 3
//        self.navigationItem.rightBarButtonItem  = button1
        
        
        
        setupSearchController()
        setupNavigationBarItems()
        setUpMainCollectionViewCell()
        createLayout()
        
        movieAPIClient.fetchMovies(movieTitle: "lion king") { (movieJson) in
            
            self.movies = [Movie]()
            
            for dictionary in movieJson {
                
                var movie = Movie()
                
                movie.title = movieJson["Title"] as? String
                movie.genre = movieJson["Genre"] as? String
                movie.imdbRating = movieJson["imdbRating"] as? String
                movie.plot = movieJson["Plot"] as? String
                movie.released = movieJson["Released"] as? String
                movie.actors = movieJson["Actors"] as? String
                movie.year = movieJson["Year"] as? String
                movie.poster = movieJson["Poster"] as? String
                
                self.movies?.append(movie)
            }
        }
        
        
        
    }
    
    
    // Create Layout
    func createLayout() {
        
        view.backgroundColor = UIColor.black
        
        self.view.addSubview(searchController.searchBar)
        searchController.searchBar.barTintColor = UIColor.black
        searchController.searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(view.snp.height).dividedBy(20)
            make.width.equalTo(view.snp.width).multipliedBy(0.95)
        }

        
        self.view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(searchController.searchBar.snp.bottom)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        


        
       
    }
    
    // Setup Cells
    func setUpMainCollectionViewCell() {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //setup Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight/4)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        mainCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        mainCollectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        mainCollectionView.isUserInteractionEnabled = true
        
    }
    
    func setupSearchController(){
        
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.definesPresentationContext = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Type Here..."
        searchController.searchBar.sizeToFit()
        searchController.isActive = true
        self.searchController.extendedLayoutIncludesOpaqueBars = true
        searchController.searchBar.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MainCollectionViewCell
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        
////        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
////        header.backgroundColor = .blue
////        return header
////    }
////    
//////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//////        return CGSize(width: view.frame.width, height: 12)
//////    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
       
        
    }
    
    
    
    

    

}

