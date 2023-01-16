//
//  MainScreenView.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 11.01.2023.
//

import UIKit

protocol MainScreenViewOutput: AnyObject {
    
}

protocol MainScreenViewInput: UIView {
    func setCollectionViewSources(source: CollectionViewSources)
    func setupOutput(output: MainScreenViewOutput)
}

typealias CollectionViewSources = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

final class MainScreenView: UIView {
    
    private weak var delegate: MainScreenViewOutput?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifer)
        addSubview(collectionView)
        return collectionView
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MainScreenView: MainScreenViewInput {
    func setCollectionViewSources(source: CollectionViewSources) {
        collectionView.delegate = source
        collectionView.dataSource = source
    }
    
    func setupOutput(output: MainScreenViewOutput) {
        self.delegate = output
    }
}
