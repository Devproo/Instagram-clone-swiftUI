//
//  Post.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,ownerUid: NSUUID().uuidString, caption: "swiftui", likes: 15, imageUrl: "my", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString,ownerUid: NSUUID().uuidString, caption: "darttui", likes: 45, imageUrl: "my", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString,ownerUid: NSUUID().uuidString, caption: "javascripttui", likes: 15, imageUrl: "my", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString,ownerUid: NSUUID().uuidString, caption: "swiftui2", likes: 195, imageUrl: "my", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        
    
    ]
    
}
