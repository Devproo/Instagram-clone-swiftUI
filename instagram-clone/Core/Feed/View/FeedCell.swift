//
//  FeedCell.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
      VStack{
            HStack{
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading, 8)
          
          KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
          
            HStack (spacing: 16){
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                    
                }
                Button {
                    print("comment ont post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                    
                }
                Button {
                    print("share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                    
                }
                Spacer()

                
            }
            .padding(.leading, 8)
            .padding(.top,4)
            .foregroundColor(.black)
            
          Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            HStack{
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6 hours ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
          
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}

