//
//  MenuItemRow.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/10/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct MenuItemRow: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationLink(destination: ItemDetail(item: self.item)) {
            ItemRow(item: self.item)
        }
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(item: MenuItem.example)
    }
}
