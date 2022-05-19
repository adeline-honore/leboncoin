//
//  TestCase.swift
//  leboncoinTests
//
//  Created by HONORE Adeline on 19/05/2022.
//

import Foundation


enum TestCase {
    case list
    
    var resource: String {
        switch self {
        case .list:
            return "list"
        }
    }
}
