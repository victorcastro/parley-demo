//
//  Announces.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 13/10/20.
//

import UIKit

struct Announces: Codable {
    let success: Bool
    let payload: [Announce]
    
    enum CodingKeys: String, CodingKey {
        case success
        case payload
    }
}

struct Announce: Codable {
    let uuid: String
    let title: String
    let hero: String?
    let description: String
    let icon: Icon?
    let category: Category
    let action: Action?
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case title
        case hero
        case description
        case icon
        case category
        case action
    }
}

struct Icon: Codable {
    let name: String?
    let color: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case color
    }
}

struct Category: Codable {
    let name: String
    let icon: Icon
    
    enum CodingKeys: String, CodingKey {
        case name
        case icon
    }
}

struct Action: Codable {
    let name: String?
    let type: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case url
    }
}

