📱 TechTest
An iOS application built with SwiftUI, Combine, and Clean Architecture principles.
This project demonstrates fetching posts from an API, displaying them in a searchable list, and navigating to a detail view with proper handling of loading, error, and empty states.


🚀 Features
✅ Fetch posts from a REST API (jsonplaceholder.typicode.com/posts)
✅ Display posts in a list view
✅ Search posts by title using .searchable (iOS 15+)
✅ Navigate to a post detail view (title & body)
✅ Handle loading, error, and empty states gracefully
✅ Modular architecture with UseCase, Repository (API Service), and ViewModel
✅ Unit tested core functionality


🏛 Architecture
The project follows a simplified Clean Architecture:
Presentation (SwiftUI Views) 
        ↓
ViewModel (State Management with Combine)
        ↓
UseCase (Business Logic Layer)
        ↓
Repository / API Service (Data Layer, Network Requests)
        ↓
Model (Entities / DTOs)


Layers:
Model → Defines Post entity.
API Service → Handles network requests using URLSession.
UseCase → Defines contracts for fetching posts, with PostUseCase protocol & PostUseCaseImpl.
ViewModel → Holds app state (isLoading, errorMessage, posts, searchText) and exposes filteredPosts.
View (SwiftUI) → Renders UI (PostListView, PostDetailView) and responds to state changes.
📂 Project Structure
TechTest/
 ┣ Models/
 ┃ ┗ Post.swift
 ┣ Services/
 ┃ ┗ APIService.swift
 ┣ UseCases/
 ┃ ┗ PostUseCase.swift
 ┣ ViewModels/
 ┃ ┗ PostListViewModel.swift
 ┣ Views/
 ┃ ┣ PostListView.swift
 ┃ ┗ PostDetailView.swift
 ┣ TechTestApp.swift
 ┗ Tests/
    ┗ TechTestTests.swift

<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/13645a2b-191f-420e-b841-044d4d18e28f" />
<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/dd3ef1f2-43d3-4074-b030-a4e058e0430a" />
<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/ad035d23-597c-4fc3-ab7f-43a7efb9f517" />



Post List	Search Posts	Post Detail
📋 Shows all posts	🔎 Search by title	📝 Show title & body
(Replace with actual screenshots if available)


⚙️ Requirements
iOS 15.0+
Xcode 14+
Swift 5.7+


📦 Installation
Clone the repository:
git clone https://github.com/yourusername/TechTest.git
cd TechTest
Open TechTest.xcodeproj in Xcode.
Build & run on simulator or device:
⌘ + R


🧪 Testing
This project uses Apple’s new Swift Testing framework (import Testing).
Example unit test for search filtering in PostListViewModel:
import Testing
@testable import TechTest

@MainActor
struct TechTestTests {
    @Test func testSearchFilter() throws {
        let viewModel = PostListViewModel()
        viewModel.posts = [
            Post(userId: 1, id: 1, title: "SwiftUI Tutorial", body: "Learn SwiftUI"),
            Post(userId: 1, id: 2, title: "Combine Basics", body: "Learn Combine"),
            Post(userId: 1, id: 3, title: "Networking in iOS", body: "Fetch data from API")
        ]
        viewModel.searchText = "SwiftUI"
        
        #expect(viewModel.filteredPosts.count == 1)
        #expect(viewModel.filteredPosts.first?.title == "SwiftUI Tutorial")
    }
}
Run tests with:
⌘ + U
🔮 Future Improvements
 Add pull-to-refresh with .refreshable
 Implement offline caching (CoreData or Realm)
 Add unit tests for API errors & empty states
 Add UI tests for navigation and search

