//
//  ProfileHeaderView.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                CircularProfileImageView(user: user, size: .large)
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 9, title: "Followers")
                    UserStatView(value: 18, title: "Following")
                   
                }
            }
            .padding(.horizontal)
           
            VStack(alignment: .leading, spacing: 4){
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                    
                }
           
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                   print("follow user")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "false")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
                
                
            }
            Divider()

        }
        .fullScreenCover(isPresented: $showEditProfile) {
         EditProfileView(user: user)
        }
        
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
