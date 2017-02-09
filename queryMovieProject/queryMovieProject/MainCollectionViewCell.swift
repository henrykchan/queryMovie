//
//  mainCollectionViewCell.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/4/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    var movie: Movie?
    var blurredPosterImageView = CustomImageView()
    var smallPosterImageView = CustomImageView()
    var titleLabel = UILabel()
    var yearLabel = UILabel()
    var ratingLabel = UILabel()
    var blackOverlay = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(blurredPosterImageView)
        blurredPosterImageView.backgroundColor = UIColor.yellow
        blurredPosterImageView.layer.borderWidth = 1
        blurredPosterImageView.layer.masksToBounds = true
        blurredPosterImageView.contentMode = .scaleAspectFill
        blurredPosterImageView.clipsToBounds = true
        blurredPosterImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height)
        }
        
        blurredPosterImageView.addSubview(blackOverlay)
        blackOverlay.backgroundColor = UIColor.clear
//        blackOverlay.layer.borderWidth = 1
//        blackOverlay.layer.masksToBounds = true
        blackOverlay.snp.makeConstraints { (make) in
            make.centerX.equalTo(blurredPosterImageView.snp.centerX)
            make.centerY.equalTo(blurredPosterImageView.snp.centerY)
            make.width.equalTo(blurredPosterImageView.snp.width)
            make.height.equalTo(blurredPosterImageView.snp.height)
        }
        
        blackOverlay.addSubview(smallPosterImageView)
        smallPosterImageView.backgroundColor = UIColor.green
        smallPosterImageView.layer.borderWidth = 1
        smallPosterImageView.layer.masksToBounds = true
        smallPosterImageView.contentMode = .scaleAspectFill
        smallPosterImageView.clipsToBounds = true
        smallPosterImageView.snp.makeConstraints { (make) in
            make.height.equalTo(blurredPosterImageView.snp.height)
            make.width.equalTo(blurredPosterImageView.snp.width).dividedBy(5)
            make.left.equalTo(blurredPosterImageView.snp.left).offset(10)
        }
        
        blackOverlay.addSubview(titleLabel)
//        titleLabel.backgroundColor = UIColor.red
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(blurredPosterImageView.snp.centerY)
            make.left.equalTo(smallPosterImageView.snp.right).offset(5)
            make.height.equalTo(blurredPosterImageView.snp.height).dividedBy(3)
        }
        
        blackOverlay.addSubview(yearLabel)
        yearLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.left.equalTo(smallPosterImageView.snp.right).offset(5)
            make.height.equalTo(blurredPosterImageView.snp.height).dividedBy(7)
        }
        
        blackOverlay.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.left.equalTo(yearLabel.snp.right).offset(10)
            make.height.equalTo(blurredPosterImageView.snp.height).dividedBy(7)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(selectedMovie: Movie) {
        
        self.titleLabel.text = selectedMovie.title
        self.yearLabel.text = selectedMovie.year
        self.ratingLabel.text = selectedMovie.imdbRating
        

        
        if let posterImageUrl = selectedMovie.poster {
            blurredPosterImageView.loadImageUsingUrlString(urlString: posterImageUrl)
            smallPosterImageView.loadImageUsingUrlString(urlString: posterImageUrl)
            print("-------------------------------------")
        }
        
//                    blurredPosterImageView.loadImageUsingUrlString(urlString: selectedMovie.poster!)
//                    smallPosterImageView.loadImageUsingUrlString(urlString: selectedMovie.poster!)
    }
}
