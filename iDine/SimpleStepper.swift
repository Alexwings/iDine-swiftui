//
//  SimpleStepper.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/26/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct SimpleStepper: View {
    public var value: Int {
        get {
            self.val
        }
    }
    @State private var val: Int = 0
    private var onIncrement: (() -> Void)?
    private var onDecrement: (() -> Void)?
    
    init(value thisValue: Int = 0,
         onIncrement inc:(() -> Void)? = nil,
         onDecrement dec: (() -> Void)? = nil) {
         val = thisValue
        self.onIncrement = inc
        self.onDecrement = dec
    }
    var body: some View {
        HStack(alignment: .center, spacing: 0){
        Button(action: {
            self.val += 1
            self.onIncrement?()
        }) {
            Image(systemName: "plus")
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        .background(Color(UIColor.lightGray))
        .foregroundColor(Color.white)
        .cornerRadius(10)
            Text("\(self.val)")
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
        Button(action: {
            self.val -= 1
            self.onDecrement?()
        }) {
            Image(systemName: "minus")
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        .background(Color(UIColor.lightGray))
        .foregroundColor(Color.white)
        .cornerRadius(10)
        }
    
    }
}

struct SimpleStepper_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStepper()
    }
}
