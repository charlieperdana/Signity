//
//  Category+TypeEnum.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import Foundation

enum Type: String {
    case basic = "Kata Dasar"
    case situation = "Situasi"
}

extension Category {
    var typeEnum: Type {
        Type(rawValue: self.type!)!
    }
}
