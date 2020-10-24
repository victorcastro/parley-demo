//
//  AnnounceTableViewHeaderFooter.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 12/10/20.
//

import UIKit

class AnnounceTableViewHeaderFooter: UITableViewHeaderFooterView {

    let today = UILabel()
    let title = UILabel()
    let image = UIImageView()
    var isDarkMode: Bool = false

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
        isDarkMode = traitCollection.userInterfaceStyle == .dark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        today.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = Constants.Font.LargeTitleBold
        today.font = Constants.Font.SubheadlineBold
        today.textColor = Constants.Color.Secundary.Default
        
        image.layer.cornerRadius = image.frame.size.height / 2
        image.layer.borderWidth = 0;

        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(today)
        contentView.backgroundColor = isDarkMode ? .systemBackground : .secondarySystemBackground
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28),
                   
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -28),
            
            today.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0),
            today.bottomAnchor.constraint(equalTo: title.topAnchor, constant: 2.0)
            
        ])
    }
}
