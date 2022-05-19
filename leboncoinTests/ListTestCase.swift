//
//  ListTestCase.swift
//  leboncoinTests
//
//  Created by HONORE Adeline on 19/05/2022.
//

import XCTest
@testable import leboncoin

class ListTestCase: XCTestCase {
    private var listService: ListService!
    
    override func tearDown() {
        super.setUp()
        listService = nil
    }
    
    private func initSUT(isFailed: Bool = false) {
        listService = ListService(network: NetworkFake(testCase: .list, isFailed: isFailed))
    }
    
    func testChangeRateShouldPostSuccess() {
        // Given
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldPostSuccessOnDataCategoryId() {
        // Given
        let category_idReceived = 8
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.category_id, category_idReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldPostSuccessOnDataTitle() {
        // Given
        let titleReceived = "Objectif Sony Fe 35mm F/2.8"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.title, titleReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldPostSuccessOnDataDescription() {
        // Given
        let descriptionReceived = "Bonjour Je vend cet objectif Sony FE Zeiss 35mm ouverture F 2.8 acheté,il y a 6 mois dans un état pratiquement neuf et dans son emballage d'origine. Pour plus d'information envoyez moi un message"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.description, descriptionReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldPostSuccessOnDataPrice() {
        // Given
        let priceReceived = 470.00
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.price, priceReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    /*
    func testChangeRateShouldPostSuccessOnDataImagesURL() {
        // Given
        let smallReceived = "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/254308d0083d9293657d938f782c079bfa4a0b3a.jpg"
        let thumbreceived = "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/254308d0083d9293657d938f782c079bfa4a0b3a.jpg"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.images_url.first?.key, smallReceived)
                XCTAssertEqual(try? result.get().first?.thumb.first?.value, thumbReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }*/
    
    func testChangeRateShouldPostSuccessOnDataCreationDate() {
        // Given
        let creationDateReceived = "2019-11-05T15:56:43+0000"
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.creation_date, creationDateReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldPostSuccessOnDataIsUrgent() {
        // Given
        let isUrgentReceived = true
        initSUT()
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTAssertEqual(try? result.get().first?.is_urgent, isUrgentReceived)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testChangeRateShouldReturnFailure() {
        // Given
        initSUT(isFailed: true)
        // When
        let expectation = XCTestExpectation(description: "Should return failure")
        // Then
        listService.getData { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(_):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.1)
    }

}
