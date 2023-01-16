//
//  File.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 12.01.2023.
//

import UIKit

struct ViewModel {
    let personId: Int
    let name: String
    let image: String
    
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
}

protocol ModelDelegate: AnyObject {
    func getData()
    func setupDelegate(delegate: MainScreenViewControllerInput)
}

final class ModelDataSource: ModelDelegate {
   
    static let shared = ModelDataSource()
    
    private weak var delegate: MainScreenViewControllerInput?
    
    private init () {}
        
    func getData() {
        NetworkManager.shared.getResultStruct { result in
            switch result {
                case .success(let success):
                let viewModels = success.results.map { ViewModel(personId: $0.id, name: $0.name, image: $0.image, status: $0.status.rawValue, species: $0.species.rawValue, type: $0.type, gender: $0.gender.rawValue, origin: $0.origin.name, location: $0.location.name)}
                    self.delegate?.getDataArray(viewModel: viewModels)
                case .failure:
                    break
            }
        }
    }
    
    func setupDelegate(delegate: MainScreenViewControllerInput) {
        self.delegate = delegate
    }
}

