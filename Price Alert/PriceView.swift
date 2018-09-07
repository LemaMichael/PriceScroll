//
//  PriceView.swift
//  Price Alert
//
//  Created by Michael Lema on 9/7/18.
//  Copyright © 2018 Michael Lema. All rights reserved.
//

import Foundation
import UIKit

class PriceView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let grayColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1)
    let blueColor = UIColor(red: 0.024, green: 0.404, blue: 0.816, alpha: 1)
    
    lazy var belowLabel: UILabel = {
       let label = UILabel()
        label.text = "BELOW"
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        label.textColor = grayColor
        return label
    }()
    lazy var aboveLabel: UILabel = {
        let label = UILabel()
        label.text = "ABOVE"
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        label.textColor = grayColor
        return label
    }()
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        return view
    }()
    lazy var divider2: UIView = {
        let view = UIView()
        view.backgroundColor = grayColor
        return view
    }()
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 20)
        label.textColor = blueColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func setupViews() {
        addSubview(belowLabel)
        addSubview(aboveLabel)
        addSubview(divider)
        addSubview(divider2)
        addSubview(priceLabel)
        backgroundColor = .white
        
        belowLabel.anchor(top: nil, bottom: nil, left: self.leftAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, paddingRight: 0, width: 55, height: 14)
        belowLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        aboveLabel.anchor(top: nil, bottom: nil, left: nil, right: self.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 10, width: 55, height: 14)
        aboveLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        divider.anchor(top: nil, bottom: nil, left: belowLabel.rightAnchor, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, paddingRight: 0, width: 65, height: 2)
        divider.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        divider2.anchor(top: nil, bottom: nil, left: nil, right: aboveLabel.leftAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 10, width: 65, height: 2)
        divider2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        priceLabel.anchor(top: nil, bottom: nil, left: divider.rightAnchor, right: divider2.leftAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 10, paddingRight: 10, width: 0, height: 38)
        priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }
    
}
