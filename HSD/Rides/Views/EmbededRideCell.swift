//
//  RideCell.swift
//  HSD
//
//  Created by rightmeow on 12/12/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

class EmbededRideCell: UICollectionViewCell {

    var ride: Ride?

    static let nibName = String(describing: EmbededRideCell.self)
    static let cell_id = String(describing: EmbededRideCell.self)

    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    private func setupCell() {

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCell()
    }

}
