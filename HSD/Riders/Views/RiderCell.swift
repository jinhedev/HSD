//
//  RiderCell.swift
//  HSD
//
//  Created by rightmeow on 12/13/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit
import RealmSwift

class RiderCell: UITableViewCell {

    var rider: User? {
        didSet {
            self.updateCell()
        }
    }

    static let cell_id = String(describing: RiderCell.self)
    static let nibName = String(describing: RiderCell.self)

    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var frameViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    private func updateCell() {
        //
    }

    private func setupCell() {
        self.backgroundColor = UIColor.blue
        self.frameView.layer.cornerRadius = self.frameViewHeightConstraint.constant / 2
        self.frameView.clipsToBounds = true
        self.titleLabel.text = "Foo Bar"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
