//
//  PostListView.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Loading posts...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.3)
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 48))
                            .foregroundColor(.orange)
                        
                        Text(errorMessage)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.red)
                        
                        Button {
                            viewModel.fetchPosts()
                        } label: {
                            Text("Retry")
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else if viewModel.filteredPosts.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "doc.text.magnifyingglass")
                            .font(.system(size: 48))
                            .foregroundColor(.gray)
                        
                        Text("No posts found")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                } else {
                    List(viewModel.filteredPosts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            Text(post.title)
                                .font(.body)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search posts by title"
            )
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}
