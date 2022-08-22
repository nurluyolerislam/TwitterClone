//
//  TweetRowView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 20.08.2022.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 20){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                //MARK: User Info & Tweet Caption
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        
                        Group {
                            Text("@batman")
                            Text("2w")
                        }
                        .foregroundColor(.gray)
                        .font(.caption)
                    }
                    
                    // MARK: Tweet Caption
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
            
            //MARK: Action Buttons
            HStack{
                Button {
                    // TODO: Mention
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // TODO: Retweet
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // TODO: Like
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // TODO: Save
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
