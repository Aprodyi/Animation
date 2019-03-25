//
//  CollectionView.swift
//  UITableView
//
//  Created by Вова on 21.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

//import Foundation
import UIKit

open class BirdsViewController: UIViewController {
    
    fileprivate lazy var collectionView: UICollectionView = {
        //let collectionViewLayout  = UICollectionViewFlowLayout()
        let collectionViewLayout = BirdsCollectionViewLayout()
        //collectionViewLayout.itemSize = CGSize(width: 100, height: 100)
        //collectionViewLayout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        
        collectionView.backgroundColor = UIColor.yellow
        collectionView.dataSource = self
        //collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.register(BirdCollectionViewCell.self, forCellWithReuseIdentifier: "BirdCollectionViewCell")
        return collectionView
        
    }()
    
    fileprivate var datasource: [String] = ["Воробей", "Петух", "Пингвин", "Голубь"]
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(collectionView)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.frame
    }

    
    
}

extension BirdsViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        //cell.backgroundColor = UIColor.gray
        let birdName = datasource[indexPath.row]
        //let label = UILabel()
        //label.text = birdName
        //label.backgroundColor = UIColor.green
        //cell.addSubview(label)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BirdCollectionViewCell", for: indexPath) as? BirdCollectionViewCell {
            cell.titleLabel.text = birdName
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
