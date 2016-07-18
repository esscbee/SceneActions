//
//  BigList.swift
//  SceneActions
//
//  Created by Stephen Brennan on 7/18/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import Foundation


class BigList {
    static let singleton = BigList()
    
    var numbers = [Int]()
    
    init() {
        for i in 0...1000000 {
            self.numbers.append(random())
        }
    }
}