//
//  Test_App_iOSTests.swift
//  Test App iOSTests
//
//  Created by Julia Liliana Sierra Rojas on 29/11/21.
//

import XCTest
@testable import Test_App_iOS

class Test_App_iOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: - Function for get sites list test.
    func testGetListSites() {
        let expGetListSites = self.expectation(description: "Test Get List Sites")
        expGetListSites.expectedFulfillmentCount = 1
        
        let sitesListViewModel = SitesListViewModel()
        
        sitesListViewModel.loadSites { error in
            if error != nil {
                XCTAssert(false)
                expGetListSites.fulfill()
            } else {
                XCTAssert(true)
                expGetListSites.fulfill()
            }
        }
        waitForExpectations(timeout: 50.0)
    }
    
    // MARK: - Function for get product search list test.
    func testGetSearchProducts() {
        let expSearch = self.expectation(description: "Test Get Search Products")
        expSearch.expectedFulfillmentCount = 1
        
        let searchProdutsViewModel = SearchProductsViewModel()
        searchProdutsViewModel.getProducts("MLA", product: "Moto"){ error in
            if error != nil {
                XCTAssert(false)
                expSearch.fulfill()
            } else {
                XCTAssert(true)
                expSearch.fulfill()
            }
            
        }
        waitForExpectations(timeout: 50.0)
    }
    
    // MARK: - Function for get product detail test.
    func testDetailProduct() {
        let expDetail = self.expectation(description: "Test Detail Product")
        expDetail.expectedFulfillmentCount = 1
        
        let detailViewModel = DetailViewModel()
        detailViewModel.getDetail(id: "MLA935110000") { result, error in
            if error != nil {
                XCTAssert(false)
                expDetail.fulfill()
            } else {
                XCTAssert(true)
                expDetail.fulfill()
            }
        }
        waitForExpectations(timeout: 50.0)
    }

}
