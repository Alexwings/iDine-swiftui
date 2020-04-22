//
//  AppView.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/10/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct AppView: View {
    private var tabNum: CGFloat = 2
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("menu")
            }
            OrderView().tabItem {
                Image(systemName: "cart")
                Text("Order")
            }
        }.font(.headline)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
