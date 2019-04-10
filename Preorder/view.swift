//
//  view.swift
//  Preorder
//
//  Created by Krasa on 04/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

class UIView {
    let id: String
    let pointInside: Bool
    var subviews = [UIView]()
    
    init(id: String, pointInside: Bool) {
        self.id = id
        self.pointInside = pointInside
    }
    
    convenience init(id: String) {
        self.init(id: id, pointInside: false)
    }
}

class ViewFactory {
    func generateForTraversin() -> UIView {
        let A = UIView(id: "A")
        let B = UIView(id: "B")
        let C = UIView(id: "C")
        let D = UIView(id: "D")
        let E = UIView(id: "E")
        let F = UIView(id: "F")
        let G = UIView(id: "G")
        let K = UIView(id: "K")
        let M = UIView(id: "M")

        A.subviews.append(contentsOf: [B, C, M])
        B.subviews.append(contentsOf: [D, E])
        C.subviews.append(contentsOf: [F, G, K])

        return A
    }
    
    func generateForPointInsie() -> UIView {
        let A = UIView(id: "A", pointInside: false)
        let B = UIView(id: "B", pointInside: true)
        let C = UIView(id: "C", pointInside: false)
        let D = UIView(id: "D", pointInside: true)
        
        A.subviews.append(B)
        B.subviews.append(contentsOf: [D, C])
        
        return A
    }
}
