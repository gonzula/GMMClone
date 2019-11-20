//
//  Comparable+Utils.swift
//  GMMClone
//
//  Created by Gonzo Fialho on 20/11/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

public extension Comparable {
    func clamp(_ value1: Self, _ value2: Self) -> Self {
        let minValue = min(value1, value2)
        let maxValue = max(value1, value2)
        return min(max(minValue, self), maxValue)
    }
}
