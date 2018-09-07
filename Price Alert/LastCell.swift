//
//  FooterCell.swift
//  Price Alert
//
//  Created by Michael Lema on 9/6/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation
import UIKit

class LastCell: UICollectionViewCell  {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let topTickView = ReusableEndTopTick()
    let bottomTickView = ReusableEndBottomTick()
    let label: UILabel = {
        let label = UILabel()
        label.text = "" //: This text will be double the current price
        label.font = UIFont(name: "Avenir-Book", size: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func setupView() {
        addSubview(topTickView)
        addSubview(label)
        addSubview(bottomTickView)
        
        topTickView.anchor(top: topAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        
        label.anchor(top: nil, bottom: nil, left: nil, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 29, height: 18)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        bottomTickView.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
    }
    
}

class ReusableEndTopTick: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let firstTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let secondTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let middleTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    func setupView() {
        addSubview(firstTick)
        addSubview(secondTick)
        addSubview(middleTick)
        firstTick.anchor(top: topAnchor, bottom: nil, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 4, paddingRight: 0, width: 1, height: 14)
        secondTick.anchor(top: topAnchor, bottom: nil, left: firstTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        middleTick.anchor(top: topAnchor, bottom: nil, left: secondTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 20)
    }
}

class ReusableEndBottomTick: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let firstTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let secondTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let middleTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    func setupView() {
        addSubview(firstTick)
        addSubview(secondTick)
        addSubview(middleTick)
        firstTick.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 4, paddingRight: 0, width: 1, height: 14)
        secondTick.anchor(top: nil, bottom: bottomAnchor, left: firstTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        middleTick.anchor(top: nil, bottom: bottomAnchor, left: secondTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 20)
    }
}
