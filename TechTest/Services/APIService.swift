//
//  APIService.swift
//  TechTest
//
//  Created by Aji Prakosa on 25/08/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .requestFailed: return "Request failed."
        case .decodingFailed: return "Failed to decode response."
        }
    }
}

final class APIService {
    
    static let shared = APIService()
    private init() {}
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func fetch<T: Decodable>(_ endpoint: String,
                             type: T.Type,
                             completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
    
    func fetchAsync<T: Decodable>(_ endpoint: String,
                                  type: T.Type) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }
}
