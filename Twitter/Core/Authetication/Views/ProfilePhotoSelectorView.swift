//
//  ProfilePhotoSelectorView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 22.08.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Create your account",
                           title2: "Add a profile photo")
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
