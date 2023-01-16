//
//  ViewController.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 11.01.2023.
//

import UIKit

protocol MainScreenViewControllerInput: AnyObject {
    func getDataArray(viewModel: [ViewModel])
}

final class MainViewController: UIViewController {
    
    private let mainView: MainScreenViewInput
    
    private var viewModels = [ViewModel]()
    
    var notesRepository: ModelDelegate = ModelDataSource.shared
    
    init(mainView: MainScreenViewInput) {
        self.mainView = mainView
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = "characters"
        
        mainView.setCollectionViewSources(source: self)
        mainView.setupOutput(output: self)
        notesRepository.setupDelegate(delegate: self)
        notesRepository.getData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
}

extension MainViewController: MainScreenViewOutput {
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifer,
                                                 for: indexPath as IndexPath) as! CustomCell
        cell.setup(viewModel: viewModels[indexPath.row])
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 160, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 50, bottom: 100, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let InfoScreen = InfoScreenViewController(infoScreenView: InfoScreenView(), data: viewModels[indexPath.row])
        self.navigationController?.pushViewController(InfoScreen, animated: true)
    }
}

extension MainViewController: MainScreenViewControllerInput {
    func getDataArray(viewModel: [ViewModel]) {
        self.viewModels = viewModel
    }
}
