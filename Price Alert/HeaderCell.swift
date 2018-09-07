//
//  HeaderCell.swift
//  Price Alert
//
//  Created by Michael Lema on 9/6/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation
import UIKit

class HeaderCell: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let topTickView = ReusableTopTick()
    let bottomTickView = ReusableBottomTick()
    let label: UILabel = {
        let label = UILabel()
        label.text = "0"
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

class ReusableTopTick: UIView {
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
        firstTick.anchor(top: topAnchor, bottom: nil, left: nil, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 4, width: 1, height: 14)
        secondTick.anchor(top: topAnchor, bottom: nil, left: nil, right: firstTick.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 1, height: 14)
        middleTick.anchor(top: topAnchor, bottom: nil, left: nil, right: secondTick.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 1, height: 20)
    }
}

class ReusableBottomTick: UIView {
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
        firstTick.anchor(top: nil, bottom: bottomAnchor, left: nil, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 4, width: 1, height: 14)
        secondTick.anchor(top: nil, bottom: bottomAnchor, left: nil, right: firstTick.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 1, height: 14)
        middleTick.anchor(top: nil, bottom: bottomAnchor, left: nil, right: secondTick.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 1, height: 20)
    }
}
