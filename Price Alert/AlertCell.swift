//
//  AlertCell.swift
//  Price Alert
//
//  Created by Michael Lema on 9/6/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation
import UIKit

class AlertCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tickerView = genericTopTickerView()
    let bottomTickerView = genericBottomTickerView()
    
    func setupCell() {
        addSubview(tickerView)
        addSubview(bottomTickerView)
        tickerView.anchor(top: topAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        bottomTickerView.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        
    }
}

class genericTopTickerView: UIView {
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
    let fourthTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let fifthTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    func setupView() {
        addSubview(firstTick)
        addSubview(secondTick)
        addSubview(middleTick)
        addSubview(fourthTick)
        addSubview(fifthTick)
        
        firstTick.anchor(top: topAnchor, bottom: nil, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        secondTick.anchor(top: topAnchor, bottom: nil, left: firstTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        middleTick.anchor(top: topAnchor, bottom: nil, left: secondTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 20)
        fourthTick.anchor(top: topAnchor, bottom: nil, left: middleTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        fifthTick.anchor(top: topAnchor, bottom: nil, left: fourthTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)

    }
}

class genericBottomTickerView: UIView {
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
    let fourthTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    let fifthTick: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    func setupView() {
        addSubview(firstTick)
        addSubview(secondTick)
        addSubview(middleTick)
        addSubview(fourthTick)
        addSubview(fifthTick)
        
        firstTick.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        secondTick.anchor(top: nil, bottom: bottomAnchor, left: firstTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        middleTick.anchor(top: nil, bottom: bottomAnchor, left: secondTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 20)
        fourthTick.anchor(top: nil, bottom: bottomAnchor, left: middleTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        fifthTick.anchor(top: nil, bottom: bottomAnchor, left: fourthTick.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 8, paddingRight: 0, width: 1, height: 14)
        
    }
}
