//
//  ViewController.swift
//  Price Alert
//
//  Created by Michael Lema on 9/6/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cellID = "cellID"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0, green: 0.357, blue: 0.584, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AlertCell.self, forCellWithReuseIdentifier: cellID)
        return collectionView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Triangle")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(collectionView)
        if #available(iOS 11.0, *) {
            self.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }       
        collectionView.addSubview(imageView)
        imageView.anchor(top: collectionView.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: -1, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 30, height: 15)
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        collectionView.anchor(top: nil, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingBottom: -50, paddingLeft: 0, paddingRight: 0, width: 0, height: 79)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 53, height: 79)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -8
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AlertCell
        return cell
    }
    
}
