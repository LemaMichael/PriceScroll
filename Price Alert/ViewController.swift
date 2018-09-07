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
    let currentPrice: Double = 6450
    let currency = "$"
    let grayColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
    let blueColor = UIColor(red: 0.024, green: 0.404, blue: 0.816, alpha: 1)
    var scrollPrice = String()
    
    let priceView = PriceView()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Triangle")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = blueColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        collectionView.register(AlertCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(FirstCell.self, forCellWithReuseIdentifier: firstCell)
        collectionView.register(LastCell.self, forCellWithReuseIdentifier: lastCell)
        return collectionView
    }()
    lazy var alertButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 0.255, green: 0.573, blue: 0.863, alpha: 1)
        button.setTitle("Create Alert", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.alpha = 0.3
        button.addTarget(self, action: #selector(alertTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    lazy var middleItem: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(priceView)
        self.view.addSubview(collectionView)
        collectionView.addSubview(imageView)
        self.view.addSubview(alertButton)
        
        if #available(iOS 11.0, *) {
            self.collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }       
        imageView.anchor(top: collectionView.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: -1, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 30, height: 15)
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        alertButton.anchor(top: nil, bottom: self.view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 73)
        
        collectionView.anchor(top: nil, bottom: alertButton.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 79)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        //        self.collectionView.reloadData() //: Testing purposes
        
        priceView.priceLabel.text = currency + String(format: "%.0f", currentPrice)
        priceView.anchor(top: nil, bottom: collectionView.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 90)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let totalNumberOfItems = self.collectionView.numberOfItems(inSection: 0)
            self.middleItem = totalNumberOfItems / 2
            print(self.middleItem)
            self.collectionView.scrollToItem(at: IndexPath(item: self.middleItem, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    @objc func alertTapped() {
        print("Button tapped at value: " + scrollPrice)
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
            cell.selectedTick.isHidden = (indexPath.item == self.middleItem) ? false: true
            cell.label.text = "\(indexPath.item * 5 )"
            return cell
        }
    }
    
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        findCenterIndex()
    }
    fileprivate func modifyPriceView(_ validIndex: IndexPath) {
        alertButton.titleLabel?.alpha = (self.middleItem == validIndex[1]) ? 0.3 : 1.0
        alertButton.isEnabled = (self.middleItem == validIndex[1]) ? false : true
        
        priceView.belowLabel.textColor = (self.middleItem > validIndex[1]) ? self.blueColor : self.grayColor
        priceView.divider.backgroundColor = (self.middleItem > validIndex[1]) ? self.blueColor : self.grayColor
        priceView.aboveLabel.textColor = (self.middleItem < validIndex[1]) ? self.blueColor : self.grayColor
        priceView.divider2.backgroundColor = (self.middleItem < validIndex[1]) ? self.blueColor : self.grayColor
    }
    
    private func findCenterIndex() {
        let center = self.view.convert(self.collectionView.center, to: self.collectionView)
        let index = collectionView.indexPathForItem(at: center)
        print(index ?? "index not found")
        guard let validIndex = index else { return }
        modifyPriceView(validIndex)
        switch validIndex.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstCell, for: validIndex) as! FirstCell
            priceView.priceLabel.text =  currency + (cell.label.text ?? "")
            scrollPrice = priceView.priceLabel.text ?? ""
        case self.collectionView.numberOfItems(inSection: 0) - 1:
            priceView.priceLabel.text = currency + String(format: "%.0f", currentPrice * 2)
            scrollPrice = priceView.priceLabel.text ?? ""
        default:
            if let cell = collectionView.cellForItem(at: validIndex) as? AlertCell {
                priceView.priceLabel.text = currency + (cell.label.text ?? "")
                scrollPrice = priceView.priceLabel.text ?? ""
                
            }
        }
    }
    
}
