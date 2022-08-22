//
//  RegistrationView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 21.08.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: self.$viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            } label: {
                EmptyView()
            }

            
            AuthHeaderView(title1: "Get started.",
                           title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeHolderText: "Email",
                                 text: self.$email)
                
                CustomInputField(imageName: "person",
                                 placeHolderText: "Username",
                                 text: self.$username)
                
                CustomInputField(imageName: "person",
                                 placeHolderText: "Full Name",
                                 text: self.$fullname)
                
                CustomInputField(imageName: "lock",
                                 placeHolderText: "Password",
                                 isSecureField: true,
                                 text: self.$password)
            }
            .padding(32)
            
            Button {
                self.viewModel.register(withEmail: self.email,
                                        password: self.password,
                                        fullname: self.fullname,
                                        username: self.username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)

            Spacer()
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Already have an account?")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom, 32)

        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
