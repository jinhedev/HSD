//
//  RealmManager.swift
//  HSD
//
//  Created by rightmeow on 12/12/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmManagerDelegate: NSObjectProtocol {
    func realmManager(_ manager: RealmManager, didFetchRides rides: Results<Ride>?)
}

class RealmManager: NSObject {

    weak var delegate: RealmManagerDelegate?

    func fetchRides() {
        
    }

}
