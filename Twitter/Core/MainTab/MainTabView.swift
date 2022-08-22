//
//  MainTabView.swift
//  Twitter
//
//  Created by Erislam Nurluyol on 20.08.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: self.$selectedTabIndex) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(2)
            
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
