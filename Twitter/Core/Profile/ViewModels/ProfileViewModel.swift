//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 7.09.2022.
//

import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    private let service = TweetService()
    private let userService = UserService()
    let user: User
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    var actionButtonTitle: String{
        return self.user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return self.tweets
        case .replies:
            return self.tweets
        case .likes:
            return self.likedTweets
        }
    }
    
    func fetchUserTweets(){
        guard let uid = self.user.id else { return }
        
        self.service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweets(){
        guard let uid = user.id else {return}
        
        self.service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
