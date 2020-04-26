//
//  OrderItemRow.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/25/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct OrderItemRow: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        HStack(alignment: .bottom, spacing: 3) {
            Image(item.thumbnailName)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading, spacing: 3) {
                Text("\(item.name)")
                Text(String(format: "$%.2f", item.price))
            }
            Spacer()
            SimpleStepper(value: Int(self.order.count(for: item)), onIncrement: {
                self.order.add(item: self.item)
            }) {
                self.order.remove(item: self.item)
            }
        }
    }
}

struct OrderItemRow_Previews: PreviewProvider {
    static let order: Order = {
        let o = Order()
        o.add(item: MenuItem.example)
        return o
    }()
    static var previews: some View {
        OrderItemRow(item: MenuItem.example).environmentObject(order)
    }
}
