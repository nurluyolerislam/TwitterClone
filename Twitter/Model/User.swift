//
//  User.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 28.08.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
