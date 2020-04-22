//
//  ContentView.swift
//  iDine
//
//  Created by Xinyuan Wang on 3/28/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var sections: [Menu] = {
        guard let menus: [Menu] = JSONDecoder().decode(file: "menu.json") else {
            return []
        }
        return menus
    }()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            MenuItemRow(item: item)
                        }
                    }
                }
            }.navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
