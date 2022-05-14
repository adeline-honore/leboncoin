//
//  ErrorType.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

enum ErrorType: Error {
    case network
    case decodingError
    
    
    var message: String {
        switch self {
        case .network:
            return "Oups!, no return from API ."
        case .decodingError:
            return "Oups!, error of decode"
        }
    }
}
