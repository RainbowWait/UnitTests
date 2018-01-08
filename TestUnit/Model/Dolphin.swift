//
//  Dolphin.swift
//  TestUnit
//
//  Created by 郑小燕 on 2018/1/8.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit

public protocol Edible {
    
}

class Dolphin: NSObject {
    var isHappy: Bool = false
    func eat(_ edible: Mackerel) {
        self.isHappy = true
    }
    
    init(happy: Bool) {
        self.isHappy = happy
    }
}

class Mackerel: Edible {
    
}

class Cod: Edible {
    
}

