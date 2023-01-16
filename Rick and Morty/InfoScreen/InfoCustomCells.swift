//
//  InfoCustomCells.swift
//  Rick and Morty
//
//  Created by дэвид Кихтенко on 14.01.2023.
//

import UIKit

final class InfoCustomCells: UICollectionViewCell {
    
    static let identifer = "InfoCustomCell"
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.textColor = .label
//        text.lineBreakMode = .byClipping
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
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(viewModel: String) {
        (viewModel.isEmpty) ? (text.text = "-") : (text.text = viewModel)
    }
}
