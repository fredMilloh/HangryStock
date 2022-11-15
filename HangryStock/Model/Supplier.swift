//
//  Supplier.swift
//  HangryStock
//
//  Created by fred M on 15/11/2022.
//

import Foundation

struct Supplier: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let deliveryDay: String
}
