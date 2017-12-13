//
//  PlaceholderBackgroundView.swift
//  HSD
//
//  Created by rightmeow on 12/12/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

protocol PlaceholderBackgroundViewDelegate: NSObjectProtocol {
    func placeholderBackgroundView(_ view: PlaceholderBackgroundView, didTapSchedule button: UIButton)
    func placeholderBackgroundView(_ view: PlaceholderBackgroundView, didTapInfo button: UIButton)
}

class PlaceholderBackgroundView: UIView {

    weak var delegate: PlaceholderBackgroundViewDelegate?

    static let nibName = String(describing: PlaceholderBackgroundView.self)

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var scheduleButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var placeholderImageViewHeightConstraint: NSLayoutConstraint!

    @IBAction func handleSchedule(_ sender: UIButton) {
        self.delegate?.placeholderBackgroundView(self, didTapSchedule: sender)
    }

    @IBAction func handleMoreInfo(_ sender: UIButton) {
        self.delegate?.placeholderBackgroundView(self, didTapInfo: sender)
    }

    private func setupView() {
        self.backgroundColor = UIColor.white
        self.placeholderImageView.layer.cornerRadius = self.placeholderImageViewHeightConstraint.constant / 2
        self.scheduleButton.layer.cornerRadius = 8
        self.infoButton.layer.cornerRadius = 8
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

}
