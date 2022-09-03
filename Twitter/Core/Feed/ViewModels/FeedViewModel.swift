//
//  FeedViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 3.09.2022.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init(){
        self.fetchTweets()
    }
    
    func fetchTweets(){
        self.service.fetchTweets { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
