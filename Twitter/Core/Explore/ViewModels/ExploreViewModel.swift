//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 3.09.2022.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        self.fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
