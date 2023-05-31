//
//  CurrentUserProfile.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI

struct CurrentUserProfile: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                ProfileHeaderView(user: user)
                
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

struct CurrentUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfile(user: User.MOCK_USERS[0])
    }
}
