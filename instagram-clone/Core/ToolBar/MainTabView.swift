//
//  MainTabView.swift
//  instagram-clone
//
//  Created by ipeerless on 20/05/2023.
//

import SwiftUI

struct MainTabView: View {
    let user: User
@State private var selectedIdex = 0
    
    var body: some View {
        TabView(selection: $selectedIdex){
            FeedView()
                .onAppear{
                    selectedIdex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
          SearchView()
                .onAppear{
                    selectedIdex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView( tabIndex: $selectedIdex)
                .onAppear{
                    selectedIdex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("notification")
                .onAppear{
                    selectedIdex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            CurrentUserProfile(user: user)
                .onAppear{
                    selectedIdex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
            
            
            
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }
}
