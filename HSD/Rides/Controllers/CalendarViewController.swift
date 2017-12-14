//
//  CalendarViewController.swift
//  HSD
//
//  Created by rightmeow on 12/14/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, ScheduleProcessViewControllerDelegate {

    var scheduleProcessViewController: ScheduleProcessViewController?

    static let storyboard_id = String(describing: CalendarViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let timeViewController = segue.destination as? TimeViewController {
            timeViewController.previousViewController = self
        }
    }

    // MARK: - ScheduleProcessViewControllerDelegate

    func scheduleProcessViewController(_ viewController: ScheduleProcessViewController, didTapControl button: UIButton) {
        print("next!")
    }

}
