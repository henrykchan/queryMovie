//
//  ViewController.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/3/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    var movies: [Movie]?
    var mainCollectionView: UICollectionView!
//    var searchBarContainerView = UIView()
    var searchText: String?
    var theSearchBar = UISearchBar()
    var searchBarActive: Bool = false

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupSearchController()
        setupNavigationBarItems()
        setUpMainCollectionViewCell()
        createLayout()
        
    }
    
    
    // Create Layout
    func createLayout() {
        
        view.backgroundColor = UIColor.black
        
        self.view.addSubview(theSearchBar)
        theSearchBar.barTintColor = UIColor.black
        theSearchBar.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(view.snp.height).dividedBy(20)
            make.width.equalTo(view.snp.width).multipliedBy(0.95)
        }

        
        self.view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(theSearchBar.snp.bottom)
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
        
        theSearchBar.delegate = self
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.delegate = self
        self.definesPresentationContext = false
//        searchController.dimsBackgroundDuringPresentation = false
//        theSearchBar.hidesNavigationBarDuringPresentation = false
        theSearchBar.placeholder = "Type Here..."
        theSearchBar.sizeToFit()
//        theSearchBar.isActive = true
//        self.searchController.extendedLayoutIncludesOpaqueBars = true
//        self.searchController.automaticallyAdjustsScrollViewInsets = true
//        searchController.searchResultsUpdater = self
        theSearchBar.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        theSearchBar.isTranslucent = false
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("*******************************\(movies?.count)")
        
        
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MainCollectionViewCell
        
        if searchText != nil {
            
            let movieIndexPath = movies?[indexPath.row]
            
            cell.updateCell(selectedMovie: movieIndexPath!)
            
        }
        return cell
    }
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.characters.count > 0 {
            self.searchBarActive = true
            self.mainCollectionView?.reloadData()
        }
        else {
            self.searchBarActive = false
            self.mainCollectionView?.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBarActive = false
        self.theSearchBar.resignFirstResponder()
        self.theSearchBar.text = ""
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        self.searchBarActive = true
        
        self.theSearchBar.setShowsCancelButton(true, animated: true)
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBarActive = true
        let searchWords = searchBar.text
        searchText = searchWords
        print("OOooooooooooooooooooooooooooooo\(searchBar.text)")
        
        if let theSearchText = searchWords {
            
            print ("*******************************************\(searchBar.text)")
            
            movieAPIClient.fetchMovies(movieTitle: theSearchText) { (movieJson) in
                
                self.movies = [Movie]()
                
                
                
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
                
                print("++++++++++++++++++++++++++++++\(self.movies)")
                
                DispatchQueue.main.async {
                    self.mainCollectionView?.reloadData()
                }
            }
        }
        else {return}
        
//        self.theSearchBar.resignFirstResponder()
//        self.view.endEditing(true)
        self.theSearchBar.endEditing(true)
    }

    
    

    
    

    

}

