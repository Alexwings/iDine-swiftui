//
//  PaymentView.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/25/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct PaymentView: View {
    
    let paymentTypes = ["Credit Card", "Wechat Pay", "Alipay", "Apple Pay"]
    @State private var paymentType = 0
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
            }.navigationBarTitle("Payment Info", displayMode: .inline)
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
