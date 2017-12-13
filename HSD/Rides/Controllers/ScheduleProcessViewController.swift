//
//  ScheduleProcessViewController.swift
//  HSD
//
//  Created by rightmeow on 12/13/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

class ScheduleProcessViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIBarButtonItem!

    static let storyboard_id = String(describing: ScheduleProcessViewController.self)

    @IBAction func handleNext(_ sender: UIButton) {
        print("abc")
    }

    @IBAction func handleCancel(_ sender: UIBarButtonItem) {
        let alerController = self.initAlertController(title: "Cancel", message: "Are you sure you want to cancel this Ride?")
        self.present(alerController, animated: true, completion: nil)
    }

    private func initAlertController(title: String, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        return alert
    }

    private func setupView() {
        self.nextButton.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

}
