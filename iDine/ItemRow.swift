//
//  ItemRow.swift
//  iDine
//
//  Created by Xinyuan Wang on 4/1/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    var body: some View {
        HStack {
            Image(self.item.thumbnailName)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading, spacing: 3.0){
                Text(self.item.name)
                    .font(.headline)
                    .lineLimit(1)
                HStack (alignment: .lastTextBaseline, spacing: 10){
                    Text(String(format: "$%.2f",
                        self.item.price.rounded(digits: 2))).lineLimit(1)
//                    Spacer(minLength: 10)
                    ForEach(self.item.restrictions, id: \.rawValue) { res in
                        Text(res.rawValue)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(5)
                            .background(res.color)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer(minLength: 150)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
