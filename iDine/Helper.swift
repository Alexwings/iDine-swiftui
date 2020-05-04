//
//  Helper.swift
//  iDine
//
//  Created by Xinyuan Wang on 3/28/20.
//  Copyright © 2020 Xinyuan Wang. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable> (file: String, in bundle: Bundle = Bundle.main) -> T? {
        guard let url = bundle.url(forResource: file, withExtension: nil) else  {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        return try? self.decode(T.self, from: data)
    }
}

extension Double {
    func rounded(digits num: Int) -> Double {
        return (self * pow(10, Double(num))).rounded() / pow(10, Double(num))
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ msg: String, specifier: String) {
        let result = String(format: specifier, msg)
        appendLiteral(result)
    }
}
