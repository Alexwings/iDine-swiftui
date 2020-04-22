//
//  Menu.swift
//  iDine
//
//  Created by Xinyuan Wang on 3/28/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import Foundation
import SwiftUI

struct Menu: Codable, Identifiable {
    let id: UUID
    let name: String
    let items: [MenuItem]
}

struct MenuItem: Codable, Identifiable, Hashable {
    
    static let example: MenuItem = try! JSONDecoder().decode(MenuItem.self, from:
        """
{
        "id": "EDCD038C-036F-4C40-826F-61C88CD84DDD",
        "name": "Maple French Toast",
        "photoCredit": "Joseph Gonzalez",
        "price": 6,
        "restrictions": ["G", "V"],
        "description": "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…"
        }
""".data(using: .utf8)!)
    
    let id: UUID
    let name: String
    let photoCredit: String
    let price: Double
    let restrictions: [Restriction]
    let description: String
    var imageName: String {
        self.name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailName: String {
        return "\(imageName)-thumb"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(name)
    }
}

enum Restriction: String, Codable {
    case D, G, V, N, S
    var color: Color {
        switch self {
        case .D:
            return .purple
        case .G:
            return .black
        case .V:
            return .green
        case .N:
            return .red
        case .S:
            return .blue
        }
    }
}
