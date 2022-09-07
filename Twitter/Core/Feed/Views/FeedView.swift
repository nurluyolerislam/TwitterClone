//
//  FeedView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 20.08.2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(self.viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            Button {
                self.showNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .frame(width: 56, height: 56)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding()
            .fullScreenCover(isPresented: self.$showNewTweetView) {
                NewTweetView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
