//
//  UIScrollView+Utils.swift
//  GMMClone
//
//  Created by Gonzo Fialho on 20/11/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

import UIKit

public extension UIScrollView {
    func setupForVerticalScrollOnly() {
        let ghostView = UIView()
        ghostView.setupForAutoLayout(in: self)
        ghostView.backgroundColor = .clear
        ghostView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ghostView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ghostView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ghostView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        ghostView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        ghostView.setRequiredSize()
    }

    func setupForHorizontalScrollOnly() {
        let ghostView = UIView()
        ghostView.setupForAutoLayout(in: self)
        ghostView.backgroundColor = .clear
        ghostView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ghostView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ghostView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        ghostView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        ghostView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        ghostView.setRequiredSize()
    }
}
