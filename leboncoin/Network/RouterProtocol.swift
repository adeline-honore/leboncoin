//
//  RouterProtocol.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

protocol RouterProtocol {
    var baseURL: String { get }
    func buildURL() -> URL?
    func asUrlRequest() -> URLRequest?
}
