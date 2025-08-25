//
//  PostUseCaseImpl.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import Foundation

final class PostUseCaseImpl: PostUseCase {
    
    private let apiService: APIService
    
    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    func getPosts(completion: @escaping (Result<[Post], APIError>) -> Void) {
        apiService.fetch("/posts", type: [Post].self, completion: completion)
    }
    
    func getPosts() async throws -> [Post] {
        try await apiService.fetchAsync("/posts", type: [Post].self)
    }
}
