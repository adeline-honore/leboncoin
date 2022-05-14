//
//  ListServiceProtocol.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation


protocol ListServiceProtocol {
    func getData(completionHandler: @escaping (Result<AdsStructure, Error>) -> ())
}
