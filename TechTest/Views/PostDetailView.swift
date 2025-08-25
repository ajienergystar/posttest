//
//  PostDetailView.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(post.body)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
