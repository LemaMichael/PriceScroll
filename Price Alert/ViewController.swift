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
    let firstCell = "firstCellID"
    let lastCell = "lastCellID"
    let currentPrice: Double = 250
    
    var label = UILabel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0, green: 0.357, blue: 0.584, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.register(AlertCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: firstCell)
        collectionView.register(LastCell.self, forCellWithReuseIdentifier: lastCell)
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
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        collectionView.anchor(top: nil, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingBottom: -50, paddingLeft: 0, paddingRight: 0, width: 0, height: 79)
      

        collectionView.dataSource = self
        collectionView.delegate = self
        //        self.collectionView.reloadData() //: Testing purposes
        
        view.addSubview(label)
        label.anchor(top: nil, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 100)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.textAlignment = .center
        view.addSubview(label)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let totalNumberOfItems = self.collectionView.numberOfItems(inSection: 0)
            self.collectionView.scrollToItem(at: IndexPath(item: Int(totalNumberOfItems / 2), section: 0), at: .centeredHorizontally, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 45, height: 79)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let customWidth = view.frame.width / 2
        
        return UIEdgeInsetsMake(0, customWidth - 22.4, 0, customWidth - 22)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let intervals = currentPrice * 2 / 5
    
        return Int(intervals) + 1 //: Add one since need an extra cell for that accounts for the last interval
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCell, for: indexPath) as! FirstCell
            return cell
        case self.collectionView.numberOfItems(inSection: 0) - 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lastCell, for: indexPath) as! LastCell
            cell.label.text = String(format: "%.0f", currentPrice * 2)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AlertCell
            cell.label.text = "\(indexPath.item * 5 )"
            return cell
        }
    }
    
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        findCenterIndex()
    }
    private func findCenterIndex() {
        let center = self.view.convert(self.collectionView.center, to: self.collectionView)
        let index = collectionView.indexPathForItem(at: center)
        print(index ?? "index not found")
        guard let validIndex = index else { return}
        switch validIndex.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCell, for: validIndex) as! FirstCell
            label.text = cell.label.text
        case self.collectionView.numberOfItems(inSection: 0) - 1:
            label.text = String(format: "%.0f", currentPrice * 2)
        default:
            if let cell = collectionView.cellForItem(at: validIndex) as? AlertCell {
                label.text = cell.label.text
            }
        }
    }
    
}
