//
//  File.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 11.01.2023.
//

import UIKit
import SDWebImage

final class CustomCell: UICollectionViewCell {
    
    static let identifer = "CustomCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        return image
    }()
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.textColor = .label
        contentView.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
            image.topAnchor.constraint(equalTo: topAnchor),
            image.heightAnchor.constraint(equalToConstant: 170),
            image.widthAnchor.constraint(equalToConstant: 170),
            
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(viewModel: ViewModel) {
        image.sd_setImage(with: URL(string: viewModel.image))
        text.text = viewModel.name
    }
}

