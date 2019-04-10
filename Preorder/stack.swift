//
//  stack.swift
//  Preorder
//
//  Created by Krasa on 04/04/2019.
//  Copyright © 2019 Nikita Semenov. All rights reserved.
//

import Foundation

protocol Descriptable: class {
    var description: String { get }
}

class Stack<T> where T: Descriptable {
    private var backingArray = [T]()
    
    var isEmpty: Bool {
        return backingArray.isEmpty
    }
    
    func push(_ element: T) {
        backingArray.append(element)
    }
    
    func push(_ elements: [T]) {
        backingArray.append(contentsOf: elements)
    }
    
    func pop() -> T? {
        guard backingArray.count > 0 else { return nil }
        return backingArray.removeLast()
    }
    
    var desription: String {
        var outStr = ""
        backingArray.forEach { outStr += $0.description + "--" }
        return outStr
    }
}
