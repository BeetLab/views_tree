//
//  HittestableView.swift
//  HitTest
//
//  Created by Krasa on 11/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class HittestableView: UIView {
    let id: String
    
    init(frame: CGRect, id: String) {
        self.id = id
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = "Undefined"
        super.init(coder: aDecoder)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("[hitTest] hittested \(id)")
        let view = super.hitTest(point, with: event)
        
        guard let hittestableView = view as? HittestableView else {
            print("[hitTest] returnin - \(view) in \(id)")
            return view
        }
        
        print("[hitTest] returning in \(id) view = \(hittestableView.id)")
        return hittestableView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        if id == "B" {
//            return true
//        }
        let testResult = super.point(inside: point, with: event)
        
        print("[point_inside] \(id) point inside = \(testResult)")
        
        return testResult
    }
}
