//
//  SettingsViewController.swift
//  HSD
//
//  Created by rightmeow on 12/13/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    static let storyboard_id = String(describing: SettingsViewController.self)

    // profileCell
    @IBOutlet weak var profileCell: UITableViewCell!
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    // termsCell
    @IBOutlet weak var termsCell: UITableViewCell!
    // privacyCell
    @IBOutlet weak var privacyCell: UITableViewCell!
    //hotlineCell
    @IBOutlet weak var hotlineCell: UITableViewCell!
    //logoutCell
    @IBOutlet weak var logoutCell: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCells()
    }

    func initAlertController(title: String, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(cancel)
        alert.addAction(ok)
        return alert
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {

        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: WebsViewController.storyboard_id) as? WebsViewController {
                    viewController.url = "https://www.hopskipdrive.com/terms-of-use"
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            } else if indexPath.row == 1 {
                if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: WebsViewController.storyboard_id) as? WebsViewController {
                    viewController.url = "https://www.hopskipdrive.com/privacy"
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let alertController = self.initAlertController(title: "Are you sure", message: nil)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    // MARK: - Cells and datasource

    private func setupCells() {
        self.frameView.layer.borderColor = UIColor.lightGray.cgColor
        self.frameView.clipsToBounds = true
        self.frameView.layer.borderWidth = 1
        self.frameView.layer.cornerRadius = 32 // total height is 64
        self.avatarImageView.enableParallaxMotion(magnitude: 13)
    }

}
