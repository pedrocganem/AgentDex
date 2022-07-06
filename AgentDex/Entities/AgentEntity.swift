//
//  AgentEntity.swift
//  AgentDex
//
//  Created by Pedro Ganem on 03/07/22.
//

struct Result: Codable {
    let result: [AgentEntity]
   
    enum CodingKeys: String, CodingKey {
        case result = "data"
    }
}

struct AgentEntity: Codable {
    let displayName: String
    let displayIconSmall: String
    
    enum CodingKeys: String, CodingKey {
        case displayName, displayIconSmall
    }
}
