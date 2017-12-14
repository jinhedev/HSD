//
//  ScheduleProcessViewController.swift
//  HSD
//
//  Created by rightmeow on 12/13/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

protocol ScheduleProcessViewControllerDelegate: NSObjectProtocol {
    func scheduleProcessViewController(_ viewController: ScheduleProcessViewController, didTapControl button: UIButton)
}

class ScheduleProcessViewController: UIViewController {

    weak var delegate: ScheduleProcessViewControllerDelegate?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIBarButtonItem!

    static let storyboard_id = String(describing: ScheduleProcessViewController.self)

    @IBAction func handleNext(_ sender: UIButton) {
        self.delegate?.scheduleProcessViewController(self, didTapControl: sender)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let calendarViewController = segue.destination as? CalendarViewController {
            calendarViewController.scheduleProcessViewController = self
            self.delegate = calendarViewController
        }
    }

}
