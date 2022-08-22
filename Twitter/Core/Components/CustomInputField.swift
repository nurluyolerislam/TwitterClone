//
//  CustomInputField.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 21.08.2022.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeHolderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: self.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if self.isSecureField ?? false{
                    SecureField(self.placeHolderText,
                                text: self.$text)
                } else {
                    TextField(self.placeHolderText,
                              text: self.$text)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeHolderText: "Email",
                         isSecureField: false,
                         text: .constant(""))
    }
}
