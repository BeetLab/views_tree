//
//  HittestableController.swift
//  HitTest
//
//  Created by Krasa on 11/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import UIKit

class HittestableController: UIViewController {
    private let mainView: HittestableView
    
    init(mainView: HittestableView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("only programmatically!!")
    }
    
    override func loadView() {
        view = mainView
    }
}
