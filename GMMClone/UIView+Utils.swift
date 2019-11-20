//
//  UIView+Utils.swift
//  GMMClone
//
//  Created by Gonzo Fialho on 20/11/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

import UIKit

public extension UIView {
    func pin(to other: UIView, withInset inset: UIEdgeInsets = .zero) {
        topAnchor.constraint(equalTo: other.topAnchor, constant: inset.top).isActive = true
        leftAnchor.constraint(equalTo: other.leftAnchor, constant: inset.left).isActive = true
        rightAnchor.constraint(equalTo: other.rightAnchor, constant: -inset.right).isActive = true
        bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: -inset.bottom).isActive = true
    }

    func setRequiredSize() {
        setContentHuggingPriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func setupForAutoLayout(in superview: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
    }

    func pinToSuperview(withInset inset: UIEdgeInsets = .zero) {
        pin(to: superview!, withInset: inset)
    }
}
