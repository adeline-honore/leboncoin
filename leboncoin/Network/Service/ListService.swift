//
//  ListService.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

class ListService: ListServiceProtocol {
    
    private var network: NetworkProtocol
        
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func getData(completionHandler: @escaping (Result<AdsStructure, Error>) -> ()) {
        
        network.callNetwork(router: ListRouter.getRate) { result in
            
            switch result {
            case .success(let data):
                do {
                    let allAds = try self.transformToAllAds(data: data)
                    completionHandler(.success(allAds))
                } catch {
                    completionHandler(.failure(error))
                }
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func transformToAllAds(data: Data) throws -> AdsStructure {
        
        do {
            let data = data
            let responseAllAds: AdsStructure
            responseAllAds = try JSONDecoder().decode(AdsStructure.self, from: data)
            return responseAllAds
        } catch {
            throw ErrorType.decodingError
        }
    }
}
