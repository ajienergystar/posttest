//
//  PostModel.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

