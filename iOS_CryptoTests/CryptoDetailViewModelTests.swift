//
//  CryptoDetailViewModelTests.swift
//  iOS_CryptoTests
//
//  Created by Ortega on 11/03/25.
//

import XCTest
@testable import iOS_Crypto

final class CryptoDetailViewModelTests: XCTestCase {

    var viewModel: CryptoDetailViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CryptoDetailViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_isNegative_amount() {
        let resultTrue = viewModel.isAmountNegative(amount: -1)
        XCTAssert(resultTrue, "Amount should be negative")
        
        let resultFalse = viewModel.isAmountNegative(amount: 1)
        XCTAssertFalse(resultFalse, "Amount should be positive")
    }
}
