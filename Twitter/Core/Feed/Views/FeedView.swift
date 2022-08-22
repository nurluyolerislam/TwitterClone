//
//  FeedView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 20.08.2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id: \.self) { _ in
                        TweetRowView()
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}