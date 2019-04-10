//
//  main.swift
//  Preorder
//
//  Created by Krasa on 04/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

extension UIView {
    func enumerate(using block: (UIView) -> Void ) {
        block(self)
        for subview in subviews {
            subview.enumerate(using: block)
        }
    }
    
    func enumerateWithStop(using block: (UIView) -> Bool ) {
        let backStack = Stack<UIView>()
        backStack.push(self)
        
        while let last = backStack.pop() {
            if !block(last) {
                return
            }
            
            backStack.push(last.subviews.reversed())
        }
    }
    
    func hitTest() -> UIView? {
        if subviews.count > 0 {
            var hasPointInSubviews = false
            for subview in subviews {
                if subview.pointInside {
                    hasPointInSubviews = true
                    return subview.hitTest()
                }
            }
            
            if !hasPointInSubviews {
                return pointInside ? self : nil
            }
            
        } else {
            return pointInside ? self : nil
        }
    }
}

extension UIView: Descriptable {
    var description: String {
        return id
    }
}

let factory = ViewFactory()
let rootForTranersing = factory.generateForTraversin()

rootForTranersing.enumerate { print($0.id) }
print("with stop")
rootForTranersing.enumerateWithStop { view in
    if view.id != "B" {
        print(view.id)
        return true
    } else {
        print("\(view.id) abortin - no more iterations")
        return false
    }
}

let rootForPointInside = factory.generateForPointInsie()
let targetView = rootForPointInside.hitTest()
print("point inside - \(targetView?.id)")
