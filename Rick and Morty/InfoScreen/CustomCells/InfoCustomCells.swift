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
        text.numberOfLines = 3
        contentView.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var headerData: UILabel = {
        let headerData = UILabel()
        headerData.textColor = .label
        contentView.addSubview(headerData)
        headerData.translatesAutoresizingMaskIntoConstraints = false
        return headerData
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
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: bottomAnchor),
            text.heightAnchor.constraint(equalToConstant: 80),

            headerData.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerData.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -25)
        ])
    }
    
    func setup(viewModel: String, headerData: String) {
        (viewModel.isEmpty) ? (text.text = "-") : (text.text = viewModel)
        self.headerData.text = headerData
    }
}
