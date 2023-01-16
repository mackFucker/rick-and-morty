//
//  InfoScreenView.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 13.01.2023.
//

import UIKit

protocol InfoScreenViewOutput: AnyObject {
    
}

protocol InfoScreenViewInput: UIView {
    func setCollectionViewSources(source: CollectionViewSources)
    func setupOutput(output: InfoScreenViewOutput)
}

final class InfoScreenView: UIView {

    private weak var delegate: InfoScreenViewOutput?
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(CustomImageCell.self, forCellWithReuseIdentifier: CustomImageCell.identifer)
        collectionView.register(InfoCustomCells.self, forCellWithReuseIdentifier:InfoCustomCells.identifer)
        addSubview(collectionView)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

extension InfoScreenView: InfoScreenViewInput {
    func setCollectionViewSources(source: CollectionViewSources) {
        collectionView.delegate = source
        collectionView.dataSource = source
    }
    
    func setupOutput(output: InfoScreenViewOutput) {
        self.delegate = output
    }
}
