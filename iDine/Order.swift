//
//  Order.swift
//  iDine
//
//  Created by Xinyuan Wang on 3/28/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

class Order: Identifiable, ObservableObject {
    @Published private(set) var items: [MenuItem] = []
    @Published private var itemCount: [MenuItem: UInt] = [:]
    var totalItemCount: UInt {
        self.itemCount.reduce(0) { (cur, valuePair) -> UInt in
            let (_, value) = valuePair
            return cur + value
        }
    }
    var total: Double {
        return itemCount.reduce(0) { (result, pair) -> Double in
            let (key, value) = pair
            return result + key.price * Double(value)
        }
    }
    
    func add(item: MenuItem) {
        if itemCount[item] == nil {
            itemCount[item] = 1
            self.items.append(item)
        } else {
            itemCount[item]! += 1
        }
    }
    
    func remove(item: MenuItem) {
        guard let count = itemCount[item] else {
            return
        }
        guard count - 1 > 0 else {
            itemCount.removeValue(forKey: item)
            items.removeAll(where: { $0.id == item.id })
            return
        }
        itemCount[item] = count - 1
    }
    
    func count(for item: MenuItem) -> UInt {
        return self.itemCount[item] ?? 0
    }
}
