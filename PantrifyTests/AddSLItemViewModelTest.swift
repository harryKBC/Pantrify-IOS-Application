//
//  AddSLItemViewModelTest.swift
//  PantrifyTests
//
//  Created by Julian Rich on 14/11/20.
//  Copyright © 2020 Harrison Kinbacher. All rights reserved.
//

import XCTest
@testable import Pantrify

class AddSLItemViewModelTest: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
      
    }

   

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }
    
    func testAddSLItemViewModelInstantiation(){
        let viewModel = AddSLItemViewModel()
        XCTAssertNotNil(viewModel, "viewModel can be instantiated.")
    }

}
