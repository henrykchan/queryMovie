//
//  mainCollectionViewCell.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/4/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    var blurredPosterImageView = UIImageView()
    var smallPosterImageView = UIImageView()
    var titleLabel = UILabel()
    var releaseDateLabel = UILabel()
    var ratingLabel = UILabel()
    var blackOverlay = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(blurredPosterImageView)
        blurredPosterImageView.backgroundColor = UIColor.yellow
        blurredPosterImageView.layer.borderWidth = 1
        blurredPosterImageView.layer.masksToBounds = true
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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
