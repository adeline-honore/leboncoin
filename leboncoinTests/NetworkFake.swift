//
//  NetworkFake.swift
//  leboncoinTests
//
//  Created by HONORE Adeline on 19/05/2022.
//

import Foundation
@testable import leboncoin

class NetworkFake: NetworkProtocol {
    
    private let testCase : TestCase
    private let extensionType = "json"
    private var isFailed: Bool = false
    
    init(testCase: TestCase, isFailed: Bool = false) {
        self.testCase = testCase
        self.isFailed = isFailed
    }
    
    func callNetwork(router: RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) {
        
        guard !isFailed else {
            completionHandler(.failure(ErrorType.network))
            return
        }
        
        let bundle = Bundle(for: NetworkFake.self)
        guard let url = bundle.url(forResource: testCase.resource, withExtension: extensionType) else {
            completionHandler(.failure(ErrorType.network))
            return
        }
        let data = try! Data(contentsOf: url)
        
        completionHandler(.success(data))
    }
}
