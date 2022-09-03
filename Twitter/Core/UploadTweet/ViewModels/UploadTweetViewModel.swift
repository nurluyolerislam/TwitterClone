//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 3.09.2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        self.service.uploadTweet(caption: caption) { success in
            if success{
                self.didUploadTweet = true
            } else {
                // show error message to user..
            }
        }
    }
    
}
