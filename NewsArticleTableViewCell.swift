//
//  CoursesTableViewCell.swift
//  mah445_FinalProject_Starter
//
//  Created by Mohammed Hussien on 5/13/20.
//  Copyright © 2020 Mohammed Hussien. All rights reserved.
//

import UIKit

class NewsArticleTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var courseNumberLabel: UILabel!
    var instructorLabel: UILabel!
 

    let padding: CGFloat = 8
    let nameLabelHeight: CGFloat = 16
    let instructorLabelHeight: CGFloat = 14

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false


        contentView.addSubview(nameLabel)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
            ])

    }

    func configure(for newsArticle: NewsArticle) {
        print("came here for some reason")
        nameLabel.text = newsArticle.abstract
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
