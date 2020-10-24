//
//  AnnounceTableViewCell.swift
//  parleyclient-ios
//
//  Created by Victor Castro on 11/10/20.
//

import UIKit
import FontAwesome_swift

class AnnounceTableViewCell: UITableViewCell {

    @IBOutlet weak var wrapper: UIView!
    @IBOutlet weak var dtMonth: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var wrCalendar: UIView!
    @IBOutlet weak var btnDislike: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    var isDarkMode: Bool = false
       
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        isDarkMode = traitCollection.userInterfaceStyle == .dark
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setup() {
        contentView.backgroundColor = isDarkMode ? .systemBackground : .secondarySystemBackground
        wrapper.backgroundColor = isDarkMode ? .secondarySystemBackground : .systemBackground
        wrapper.layer.borderColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.secondarySystemBackground.cgColor : UIColor(hex: "#E9EAEB")?.cgColor
        wrapper.layer.shadowColor = UIColor.gray.cgColor
        wrapper.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        wrapper.layer.shadowRadius = 12.0
        wrapper.layer.shadowOpacity = 0.7
        
        btnDislike.setImage(UIImage.fontAwesomeIcon(name: .thumbsDown, style: .regular, textColor: .quaternaryLabel , size: CGSize(width: 20, height: 20)), for: .normal)
        btnLike.setImage(UIImage.fontAwesomeIcon(name: .thumbsUp, style: .regular, textColor: .defaultColor , size: CGSize(width: 20, height: 20)), for: .normal)
        btnShare.setImage(UIImage.fontAwesomeIcon(name: .shareSquare, style: .solid, textColor: .defaultColor , size: CGSize(width: 20, height: 20)), for: .normal)
    }
}
