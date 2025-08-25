//
//  PostListViewModel.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import Foundation

@MainActor
final class PostListViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchText: String = ""
    
    private let useCase: PostUseCase
    
    init(useCase: PostUseCase = PostUseCaseImpl()) {
        self.useCase = useCase
    }
    
    var filteredPosts: [Post] {
        guard !searchText.isEmpty else { return posts }
        return posts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    func fetchPosts() {
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let result = try await useCase.getPosts()
                posts = result
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}
