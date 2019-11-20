//
//  FloatingPoint+Utils.swift
//  GMMClone
//
//  Created by Gonzo Fialho on 20/11/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

public extension FloatingPoint {
    func lerp(from from1: Self, _ from2: Self, to to1: Self, _ to2: Self) -> Self {
        var retVal = self
        let fromSpan = from2 - from1
        let toSpan = to2 - to1

        retVal -= from1
        retVal /= fromSpan

        retVal *= toSpan
        retVal += to1

        return retVal
    }
}
