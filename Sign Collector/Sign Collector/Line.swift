//
//  Line.swift
//  Sign Collector
//
//  Created by User on 10.09.15.
//  Copyright (c) 2015 CodeSWAT. All rights reserved.
//

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    
    var startX: CGFloat {
        get {
            return start.x
        }
    }
    var startY: CGFloat {
        get {
            return start.y
        }
    }
    
    var endX: CGFloat {
        get {
            return end.x
        }
    }
    
    var endY: CGFloat {
        get {
            return end.y
        }
    }
    
    init(start _start: CGPoint, end _end: CGPoint) {
        start = _start
        end = _end
    }
}
