//
//  ListRouter.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

enum ListRouter: RouterProtocol {
    
    var baseURL: String {
    "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    }
    
    case getRate
    
    func buildURL() -> URL? {
        return URL(string: baseURL)
    }
    
    func asUrlRequest() -> URLRequest? {
        guard let url = buildURL() else {
            return nil
        }
        return URLRequest(url: url)
    }
}
