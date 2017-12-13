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
    func realmManager(_ manager: RealmManager, didErr error: Error)
    func realmManager(_ manager: RealmManager, didFetchRides rides: Results<Ride>?)
    func realmManager(_ manager: RealmManager, didFetchUsers users: Results<User>?)
    func realmManager(_ manager: RealmManager, didAddObjects objects: [Object])
}

extension RealmManagerDelegate {
    func realmManager(_ manager: RealmManager, didFetchRides rides: Results<Ride>?) {}
    func realmManager(_ manager: RealmManager, didFetchUsers users: Results<User>?) {}
    func realmManager(_ manager: RealmManager, didAddObjects objects: [Object]) {}
}

var realm: Realm!

func setupRealm() {
    let config = Realm.Configuration(fileURL: URL.inDocumentDirectory(fileName: "default.realm"), schemaVersion: 0, migrationBlock: nil, objectTypes: [User.self, Ride.self])
    realm = try! Realm(configuration: config)
}

class RealmManager: NSObject {

    weak var delegate: RealmManagerDelegate?
    static var pathForDefaultContainer: URL? { return Realm.Configuration.defaultConfiguration.fileURL }

    // Fetch

    func fetchRides() {
        let rides = realm.objects(Ride.self)
        self.delegate?.realmManager(self, didFetchRides: rides)
    }

    func fetchUsers() {
        let users = realm.objects(User.self)
        self.delegate?.realmManager(self, didFetchUsers: users)
    }

    // Add

    func addObject(objects: [Object]) {
        do {
            try realm.write {
                realm.add(objects, update: true)
            }
            self.delegate?.realmManager(self, didAddObjects: objects)
        } catch let err {
            self.delegate?.realmManager(self, didErr: err)
        }
    }

}
