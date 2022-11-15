//
//  SupplierViewModel.swift
//  HangryStock
//
//  Created by fred M on 15/11/2022.
//

import Foundation

class SupplierViewModel: ObservableObject {
    
    @Published var suppliers: [Supplier]
    
    init(suppliers: [Supplier]) {
        self.suppliers = suppliers
    }
    
    func addSupplier(_ supplier: Supplier) {
        suppliers.append(supplier)
    }
    
    func deleteSupplier(atOffsets: IndexSet) {
        suppliers.remove(atOffsets: atOffsets)
    }
    
    func move(fromOffsets source: IndexSet, toOffset destination: Int) {
        suppliers.move(fromOffsets: source, toOffset: destination)
    }
}
