//
//  TechTestTests.swift
//  TechTestTests
//
//  Created by Aji Prakosa on 25/08/25.
//

import Testing
@testable import TechTest

struct TechTestTests {

    @Test func testSearchFilter() async throws {
        // Given
        let viewModel = await PostListViewModel()
        
        await MainActor.run {
            viewModel.posts = [
                Post(userId: 1, id: 1, title: "SwiftUI Tutorial", body: "Learn how to build apps with SwiftUI."),
                Post(userId: 1, id: 2, title: "Combine Basics", body: "Introduction to reactive programming."),
                Post(userId: 1, id: 3, title: "Networking in iOS", body: "How to fetch data from an API.")
            ]
            
            viewModel.searchText = "SwiftUI"
        }
        
        // Then
        await #expect(viewModel.filteredPosts.count == 1)
        await #expect(viewModel.filteredPosts.first?.title == "SwiftUI Tutorial")
    }
}
