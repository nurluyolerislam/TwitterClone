//
//  AuthHeaderView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 21.08.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            
            Text(self.title1)
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text(self.title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello",
                       title2: "Welcome Back")
    }
}
