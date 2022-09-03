//
//  ExploreViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 3.09.2022.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if self.searchText.isEmpty{
            return self.users
        } else {
            let lowercasedQuery = self.searchText.lowercased()
            
            return self.users.filter({
                $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init(){
        self.fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
