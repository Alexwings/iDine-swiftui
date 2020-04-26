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
                                OrderItemRow(item: item)
                            }
                }
                .listStyle(DefaultListStyle())
            }.navigationBarTitle("My Order", displayMode: .inline)
        }
    }
}

struct OrderFooter: View {
    let totalPrice: Double
    @State private  var showingPayment = false
    var body: some View {
        HStack(alignment: .bottom) {
            Text(String(format: "Total: $%.2f", totalPrice))
            .padding(8)
            .background(Color.green)
            .cornerRadius(8)
                .foregroundColor(Color.white)
                .font(.headline)
            Spacer(minLength: 50)
            Button(action: {
                self.showingPayment.toggle()
            }) {
                Text("Place Order")
                .padding(8)
                .background(Color.green)
                .cornerRadius(8)
                    .foregroundColor(Color.white)
                    .font(.headline)
            }.sheet(isPresented: $showingPayment) {
                return PaymentView()
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
