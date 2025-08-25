//
//  PostUseCase.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import Foundation

protocol PostUseCase {
    func getPosts(completion: @escaping (Result<[Post], APIError>) -> Void)
    
    func getPosts() async throws -> [Post]
}
