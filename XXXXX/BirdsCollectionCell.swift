//
//  BirdsViewController.swift
//  UITableView
//
//  Created by Вова on 21.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

//import Foundation
import UIKit


final internal class BirdCollectionViewCell: UICollectionViewCell {
    
    let coverImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        coverImageView.backgroundColor = UIColor.blue
        self.addSubview(coverImageView)
        
        self.addSubview(titleLabel)
        
        button.backgroundColor = UIColor.purple
        button.addTarget(self, action:  #selector(didTap), for: .touchUpInside)
        
        addSubview(subtitleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func didTap() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let coverImageViewX = self.frame.width
        let coverImageViewY = self.frame.height
        coverImageView.frame = CGRect(x: 0, y: 0, width: coverImageViewX, height: coverImageViewY)
        
        let titleLabelY = coverImageView.frame.maxY
        let titleLabelWidth = frame.width - 20
        titleLabel.frame = CGRect(x: 10, y: titleLabelY, width: titleLabelWidth, height: 15)
        
//        let subtitleLabelY = titleLabel.frame.maxY + 5
//        subtitleLabel.frame = CGRect(x: 10, y: subtitleLabelY, width: titleLabelWidth, height: 10)
    }
    
}
