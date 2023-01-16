//
//  File.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 13.01.2023.
//

import UIKit

final class InfoScreenViewController: UIViewController {
    
    private let infoScreenView: InfoScreenViewInput
    
    private var data: ViewModel
    
    var notesRepository: ModelDelegate = ModelDataSource.shared
    
    init(infoScreenView: InfoScreenViewInput, data: ViewModel) {
        self.infoScreenView = infoScreenView
        self.data = data
        print(data)
        super.init(nibName: nil, bundle: nil)
        self.title = data.name
        
        infoScreenView.setCollectionViewSources(source: self)
        infoScreenView.setupOutput(output: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = infoScreenView
    }
}

extension InfoScreenViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        case 3:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        switch (indexPath.section, indexPath.row) {
            case (0,0):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomImageCell.identifer, for: indexPath)
                (cell as!  CustomImageCell).setup(viewModel: data.image)
            case (1,0):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.origin)
            case (1,1):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.location)
            case (2,0):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.gender)
            case (2,1):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.species)
            case (3,0):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.type)
            case (3,1):
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.status)
            default:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCustomCells.identifer, for: indexPath)
                (cell as! InfoCustomCells).setup(viewModel: data.origin)
                break
        }
        return cell
    }
}

extension InfoScreenViewController: UICollectionViewDelegate {
    
}

extension InfoScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize
        switch (indexPath.section, indexPath.row) {
            case (0,0):
                size = CGSize(width: view.frame.width - 160, height: 200)
            default:
                size = CGSize(width: 150, height: 100)
                break
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var edgeInsets: UIEdgeInsets
        switch (section) {
            case (0):
                edgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 100, right: 50)
            default:
                edgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 10, right: 15)
                break
        }
        return edgeInsets
       
    }
}

extension InfoScreenViewController: InfoScreenViewOutput {
    
}
