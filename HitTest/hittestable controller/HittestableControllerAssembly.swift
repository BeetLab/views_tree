//
//  HittestableControllerAssembly.swift
//  HitTest
//
//  Created by Krasa on 11/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class HittestableControllerAssembly {
    func buildController() -> HittestableController {
        let view = buildHittestableViewHierarchy()
        return HittestableController(mainView: view)
    }
}

extension HittestableControllerAssembly {
    private func buildHittestableViewHierarchy() -> HittestableView {
        let viewA = HittestableView(frame: CGRect.zero, id: "A")
        viewA.backgroundColor = UIColor.red
        
        let viewB = HittestableView(frame: CGRect.zero, id: "B")
        viewA.addSubview(viewB)
        viewB.backgroundColor = UIColor.green
        viewB.translatesAutoresizingMaskIntoConstraints = false
        
        let w = viewB.widthAnchor.constraint(equalToConstant: 200)
        let h = viewB.heightAnchor.constraint(equalToConstant: 200)
        let cx = viewB.centerXAnchor.constraint(equalTo: viewA.centerXAnchor)
        let cy = viewB.centerYAnchor.constraint(equalTo: viewA.centerYAnchor)
        
        let viewC = HittestableView(frame: CGRect.zero, id: "C")
        viewB.addSubview(viewC)
        viewC.backgroundColor = UIColor.blue
        viewC.translatesAutoresizingMaskIntoConstraints = false
        
        let cw = viewC.heightAnchor.constraint(equalToConstant: 150)
        let cl = viewC.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 30)
        let ct = viewC.trailingAnchor.constraint(equalTo: viewB.trailingAnchor, constant: -30)
        let ctop = viewC.topAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -80)
        
        NSLayoutConstraint.activate([w, h, cx, cy, cw, cl, ct, ctop])

        return viewA
    }
}
