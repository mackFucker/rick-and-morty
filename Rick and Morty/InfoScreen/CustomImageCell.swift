//
//  CustomImageCell.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 14.01.2023.
//

import UIKit


final class CustomImageCell: UICollectionViewCell {
    
    static let identifer = "CustomImageCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        return image
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setup(viewModel: String) {
        image.sd_setImage(with: URL(string: viewModel))
    }
}
