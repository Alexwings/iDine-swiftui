//
//  PaymentView.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/25/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI
import Foundation

struct PaymentView: View {
    @EnvironmentObject var order: Order
    let paymentTypes = ["Credit Card", "Wechat Pay", "Alipay", "Apple Pay"]
    let tipPercentages = [10,15,20,25,0]
    @State private var hasTips = true
    @State private var paymentType = 0
    @State private var tipPercent = 0
    private var totalPrice: Double {
        let total = order.total
        let tip = total * Double(tipPercentages[tipPercent]) / 100.0
        return total + tip
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $paymentType, label: Text("Plase select your payment type")) {
                        ForEach(0..<self.paymentTypes.count) {
                            Text(self.paymentTypes[$0])
                        }
                    }
                }
                Section {
                    Toggle(isOn: $hasTips) {
                        Text("Gratuity?")
                    }
                    if hasTips {
                        Picker("", selection: $tipPercent.animation()) {
                            ForEach(0..<self.tipPercentages.count ) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                            }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("Total: $\(self.totalPrice, specifier: "%.2f")")) {
                    Text("Confirm Order")
                        .foregroundColor(Color.blue)
                        .font(.callout)
                }
            }.navigationBarTitle("Payment Info", displayMode: .inline)
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static let order: Order = {
        let o = Order()
        o.add(item: MenuItem.example)
        return o
    }()
    
    static var previews: some View {
        PaymentView().environmentObject(order)
    }
}
