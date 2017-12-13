//
//  Session.swift
//  HSD
//
//  Created by rightmeow on 12/13/17.
//  Copyright © 2017 rightmeow. All rights reserved.
//

import Foundation
import RealmSwift

class Session: Object {

    @objc dynamic var session_id = ""
    @objc dynamic var is_loggedin: Bool = false

    override static func primaryKey() -> String? {
        return "session_id"
    }

    let sessions = LinkingObjects(fromType: User.self, property: "sessions")

}
