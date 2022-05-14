//
//  AdsStructure.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import Foundation

struct OneAd: Codable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Double
    let images_url: ImagesURL
    let creation_date: String
    let is_urgent: Bool
    let siret: String?
}

// MARK: - ImagesURL
struct ImagesURL: Codable {
    let small, thumb: String?
}

typealias AdsStructure = [OneAd]
