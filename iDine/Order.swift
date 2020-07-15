//
//  Order.swift
//  iDine
//
//  Created by Xinyuan Wang on 3/28/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI
import Foundation

class Order: Identifiable, ObservableObject {
    @Published private(set) var items: [MenuItem] = []
    @Published private var itemCount: [MenuItem: UInt] = [:]
    private var lock: NSLock = NSLock()
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
    func clearOrder(_ handler: (Bool) -> Void) {
        guard self.lock.try() else {
            handler(false)
            return
        }
        self.items.removeAll()
        self.itemCount.removeAll()
        handler(self.items.isEmpty && self.itemCount.isEmpty)
        self.lock.unlock()
        
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

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
