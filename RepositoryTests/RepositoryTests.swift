//
//  RepositoryTests.swift
//  RepositoryTests
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import XCTest
import Mockingjay
@testable import Repository

class RepositoryTests: XCTestCase {
    
    func testFetchRecipesFirstPage() {
        let dataStore = Food2ForkWebservice()
        let expectation = XCTestExpectation(description: "Fetching recipes. Page 1")
        
        dataStore.fetchRecipes(at: 1) { (response) in
            guard let recipes = try? response.get() else {
                return XCTFail()
            }
            
            XCTAssertFalse(recipes.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testFetchRecipesForbidden() {
        let dataStore = Food2ForkWebservice()
        let page: UInt = 3
        stub(uri(Food2ForkEndpoint.search(dataStore.apiKey, page).url),
             http(403))
        
        let expectation = XCTestExpectation(description: "Mocking Forbidden response")
        dataStore.fetchRecipes(at: page) { (response) in
            switch response {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, .forbidden)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }

}
