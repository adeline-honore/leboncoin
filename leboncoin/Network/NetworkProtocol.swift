//
//  NetworkProtocol.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

protocol NetworkProtocol {
    func callNetwork(router: RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ())
}
