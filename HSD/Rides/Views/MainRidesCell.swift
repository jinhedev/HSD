//
//  MainUpcomingRidesCell.swift
//  HSD
//
//  Created by rightmeow on 12/12/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit
import RealmSwift

enum MainRidesCellType {
    case upcoming
    case completed
}

class MainRidesCell: UICollectionViewCell {

    var cellType: MainRidesCellType?

    var rides: Results<Ride>?

    var ridesViewController: RidesViewController?
    var placeholderBackgroundView: PlaceholderBackgroundView?

    static let cell_id = String(describing: MainRidesCell.self)
    static let nibName = String(describing: MainRidesCell.self)

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!

    private func setupCollectionView() {
        self.backgroundColor = UIColor.lightGray
        self.collectionView.backgroundColor = UIColor.lightGray
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupBackgroundView()
        self.setupCollectionView()
    }

}

extension MainRidesCell: PlaceholderBackgroundViewDelegate {

    fileprivate func setupBackgroundView() {
        placeholderBackgroundView = UINib(nibName: PlaceholderBackgroundView.nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as? PlaceholderBackgroundView
        self.collectionView.backgroundView = placeholderBackgroundView
        self.placeholderBackgroundView!.delegate = self
//        self.placeholderBackgroundView!.isHidden = true
    }

    func placeholderBackgroundView(_ view: PlaceholderBackgroundView, didTapInfo button: UIButton) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: WebsViewController.storyboard_id) as? WebsViewController {
            viewController.url = "http://help.hopskipdrive.com"
            self.ridesViewController?.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    func placeholderBackgroundView(_ view: PlaceholderBackgroundView, didTapSchedule button: UIButton) {
        if let scheduleProcessViewController = self.ridesViewController?.storyboard?.instantiateViewController(withIdentifier: ScheduleProcessViewController.storyboard_id) as? ScheduleProcessViewController {
            let navigationController = UINavigationController(rootViewController: scheduleProcessViewController)
            self.ridesViewController?.present(navigationController, animated: true, completion: nil)
        }
    }

}

extension MainRidesCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }

}

extension MainRidesCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 128)
    }

}

extension MainRidesCell: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rides?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: implement this
        return UICollectionViewCell()
    }

}
