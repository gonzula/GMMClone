//
//  View.swift
//  GMMClone
//
//  Created by Gonzo Fialho on 20/11/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

import UIKit

extension ViewController {
    class View: UIView {
        let scrollView = UIScrollView()
        let frontTab = UIView()
        let backTab = UIView()

        let lowerPositionRatio: CGFloat = 0.8
        let upperPositionRatio: CGFloat = 0.3

        var lowerPosition: CGFloat {lowerPositionRatio * bounds.height}
        var upperPosition: CGFloat {upperPositionRatio * bounds.height}

        var backTabTopConstraint: NSLayoutConstraint!

        override init(frame: CGRect) {
            super.init(frame: frame)

            setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)

            setup()
        }

        private func setup() {
            backTab.backgroundColor = .purple
            frontTab.backgroundColor = .orange
            scrollView.backgroundColor = .clear

            backTab.setupForAutoLayout(in: self)
            scrollView.setupForAutoLayout(in: self)
            frontTab.setupForAutoLayout(in: scrollView)

            scrollView.setupForVerticalScrollOnly()
            scrollView.delegate = self
            scrollView.pinToSuperview()

            backTabTopConstraint = backTab.topAnchor.constraint(equalTo: topAnchor)
            backTabTopConstraint.isActive = true
            backTab.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            backTab.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            backTab.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

            let ghostView = UIView()
            ghostView.setupForAutoLayout(in: scrollView)
            ghostView.backgroundColor = .green
            ghostView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            ghostView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            ghostView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: lowerPositionRatio).isActive = true
            ghostView.widthAnchor.constraint(equalToConstant: 1).isActive = true

            frontTab.topAnchor.constraint(equalTo: ghostView.bottomAnchor).isActive = true
            frontTab.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
            frontTab.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
            frontTab.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            frontTab.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        }
    }
}

extension ViewController.View: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        backTabTopConstraint.constant = scrollView.contentOffset.y.lerp(from: 0, lowerPosition - upperPosition,
                                                                        to: lowerPosition, 0)
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.y < (lowerPosition - upperPosition) / 2 {
            targetContentOffset.pointee.y = 0
        } else if targetContentOffset.pointee.y < (lowerPosition - upperPosition) {
            targetContentOffset.pointee.y = (lowerPosition - upperPosition)
        }
    }
}
