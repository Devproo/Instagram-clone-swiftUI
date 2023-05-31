//
//  User.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
}
 
extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Adam", profileImageUrl: nil, fullname: "Adan Moh",bio: "Start my life", email: "ipeerless0@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Adam1", profileImageUrl: nil, fullname: "Adan Moh",bio: "Start my life", email: "ipeerless0@gmail1.com"),
        .init(id: NSUUID().uuidString, username: "Adam2", profileImageUrl: nil, fullname: nil, bio: "Start my life", email: "ipeerless0@gmail2.com"),
        .init(id: NSUUID().uuidString, username: "Adam3", profileImageUrl: nil, fullname: "Adan Moh",bio: "Start my life", email: "ipeerless0@gmail3.com"),
    
    ]
}
    
    

