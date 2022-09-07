//
//  TweetRowViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 7.09.2022.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet){
        self.tweet = tweet
        self.checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        self.service.likeTweet(self.tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        self.service.unlikeTweet(self.tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        self.service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
