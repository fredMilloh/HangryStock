//
//  SupplierViewModelTests.swift
//  HangryStockTests
//
//  Created by fred M on 15/11/2022.
//

import XCTest
@testable import HangryStock

final class SupplierViewModelTests: XCTestCase {
    
    let suppliersTest = [
        Supplier(name: "supplier1", description: "vegetables", deliveryDay: "monday"),
        Supplier(name: "supplier2", description: "cheeses", deliveryDay: "tuesday"),
        Supplier(name: "supplier3", description: "fish", deliveryDay: "thursday")
    ]
    
    lazy var sut = SupplierViewModel(suppliers: suppliersTest)
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SupplierViewModel(suppliers: suppliersTest)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_currentCount_of_suppliers_array_and_good_index() {
        // arrange
        sut.suppliers = suppliersTest
        // act
        let countShouldBe = sut.suppliers.count
        let selectedSupplier = sut.suppliers[1]
        // assert
        XCTAssertEqual(countShouldBe, 3)
        XCTAssertEqual(selectedSupplier.name, "supplier2")
    }
    
    func test_given_suppliers_when_add_one_then_array_updated() {
        // arrange
        sut.suppliers = suppliersTest
        // act
        let newSupplier = Supplier(name: "supplier4", description: "eggs", deliveryDay: "wednesday")
        sut.addSupplier(newSupplier)
        let countShouldBe = sut.suppliers.count
        let selectedSupplier = sut.suppliers.last
        // assert
        XCTAssertEqual(countShouldBe, 4)
        XCTAssertEqual(selectedSupplier?.deliveryDay, "wednesday")
    }
    
    func test_given_suppliers_when_delete_one_then_array_updated() {
        // arrange
        sut.suppliers = suppliersTest
        // act
        sut.deleteSupplier(atOffsets: IndexSet(integer: 3))
        let countShouldBe = sut.suppliers.count
        let selectedSupplier = sut.suppliers.last
        // assert
        XCTAssertEqual(countShouldBe, 3)
        XCTAssertEqual(selectedSupplier?.name, "supplier3")
    }
    
    func test_given_suppliers_when_move_second_to_first_then_array_updated() {
        // arrange
        sut.suppliers = suppliersTest
        // act move suppliers index 1 to index 0
        sut.move(fromOffsets: IndexSet(integer: 1), toOffset: 0)
        let newSuppliersList = sut.suppliers
        let newFirstSupplierNameIs = newSuppliersList[0].name
        let newSecondSupplierDeliveryDayIs = newSuppliersList[1].deliveryDay
        // assert
        XCTAssertEqual(newFirstSupplierNameIs, "supplier2")
        XCTAssertEqual(newSecondSupplierDeliveryDayIs, "monday")
    }
}
