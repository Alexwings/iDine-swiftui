//
//  OrderView.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/10/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Items"),
                        footer: OrderFooter(totalPrice: order.total)) {
                    ForEach(order.items) { item in
                        HStack(alignment: .bottom, spacing: 10) {
                            ItemRow(item: item)
                            Text("count: \(self.order.count(for: item))").font(.system(size: 16))
                        }
                    }
                }
                .listStyle(DefaultListStyle())
            }.navigationBarTitle("My Order", displayMode: .inline)
        }
    }
}

struct OrderFooter: View {
    let totalPrice: Double
    var body: some View {
        HStack(alignment: .center) {
            Text(String(format: "Total: $%.2f", totalPrice))
            .padding(8)
            .background(Color.green)
            .cornerRadius(8)
                .foregroundColor(Color.white)
                .font(.headline)
            Spacer()
            Button(action: {
                print("Place Order")
            }) {
                Text("Place Order")
                .padding(8)
                .background(Color.green)
                .cornerRadius(8)
                    .foregroundColor(Color.white)
                    .font(.headline)
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order: Order = {
        let or = Order()
        or.add(item: MenuItem.example)
        return or
    }()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
