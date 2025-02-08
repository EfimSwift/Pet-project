//
//  CustomCell.swift
//  Konspekt
//
//  Created by user on 05.02.2025.
//

import UIKit

class CustomCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 4
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        
        addSubview(label)
        
    NSLayoutConstraint.activate([
    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
    label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
    label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
    label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String) {
        label.text = title
    }
}
