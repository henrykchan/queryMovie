//
//  ViewController.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/3/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Navigation Controller
//        let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: self, action: #selector(getter: UIDynamicBehavior.action)) // action:#selector(Class.MethodName) for swift 3
//        self.navigationItem.rightBarButtonItem  = button1
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: nil), animated: true)
        self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .action , target: self, action: nil), animated: true)
        
        setUpMainCollectionViewCell()
        createLayout()
        
        
    }
    
    
    // Create Layout
    func createLayout() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MainCollectionViewCell
        
        return cell
    }
    
    

    

}

