//
//  NetworkManager.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 11.01.2023.
//

import UIKit

struct Welcome: Codable {
    let info: Info
    let results: [Results]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct Results: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let mainURL: String = "https://rickandmortyapi.com/api/character/"
    
    func getResultStruct(completion: @escaping (Result<Welcome, Error>) -> Void) {
        getData(url: URL(string:mainURL)!, completion: completion)
    }
    
     func getData<T:Decodable>(url: URL, completion: @escaping (Result<T,Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else { return }
            
            completion(.success(decodedData))
        }
        task.resume()
    }
}
