//
//  ContentView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 20.08.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if self.viewModel.userSession == nil{
                LoginView()
            } else {
                self.mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading){
            MainTabView()
            
            if self.showMenu{
                ZStack{
                    Color.black.opacity(self.showMenu ? 0.25 : 0.0)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.showMenu = false
                            }
                        }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: self.showMenu ? 0 : -300)
                .background(self.showMenu ? .white : .clear)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(self.showMenu ? "" : "Home")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = self.viewModel.currentUser{
                    if !self.showMenu{
                        Button {
                            withAnimation(.easeInOut) {
                                self.showMenu.toggle()
                            }
                        } label: {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .onAppear {
            self.showMenu = false
        }
    }
}
