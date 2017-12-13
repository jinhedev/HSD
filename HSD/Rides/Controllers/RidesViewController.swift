//
//  ViewController.swift
//  HSD
//
//  Created by rightmeow on 12/12/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import UIKit
import RealmSwift

class RidesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var mainUpcomingRidesCell: UICollectionViewCell?
    var mainCompletedRidesCell: UICollectionViewCell?
    static let storyboard_id = String(describing: RidesViewController.self)

    @IBOutlet weak var menuBarView: MenuBarView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var giftButton: UIBarButtonItem!

    private func setupCollectionView() {
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.register(UINib(nibName: MainRidesCell.nibName, bundle: nil), forCellWithReuseIdentifier: MainRidesCell.cell_id)
    }

    // MARK: - MenuBarView

    func setupMenuBarView() {
        self.menuBarView.ridesViewController = self
    }

    func scrollToIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.left, animated: true)
    }

    // MARK: - NavigationBar

    @IBAction func giftButton(_ sender: UIBarButtonItem) {
        print(123)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUICollectionViewDelegateFlowLayout()
        self.setupCollectionView()
        self.setupMenuBarView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - ScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // synchronising the scrolling position between menuBarView and the mainTasksCollectionView
        self.menuBarView.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 2
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // select a collectionView item in menuBarView when scroll ends dragging
        let selectedIndexItem = targetContentOffset.pointee.x / self.collectionView.frame.width
        let selectedIndexPath = IndexPath(item: Int(selectedIndexItem), section: 0)
        self.menuBarView.collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.left)
        self.menuBarView.selectedIndexPath = selectedIndexPath
    }


    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    private func setupUICollectionViewDelegateFlowLayout() {
        self.collectionViewLayout.scrollDirection = .horizontal
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.collectionView.frame.width
        let cellHeight = self.collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MainRidesCell.cell_id, for: indexPath) as? MainRidesCell else {
            return UICollectionViewCell()
        }
        cell.ridesViewController = self
        if indexPath.item == 0 {
            cell.cellType = MainRidesCellType.upcoming
        } else if indexPath.item == 1 {
            cell.cellType = MainRidesCellType.completed
        }
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

}
