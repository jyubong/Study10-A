//
//  Potable.swift
//  POP
//
//  Created by Hisop on 2023/11/18.
//

protocol Portable {}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
}
