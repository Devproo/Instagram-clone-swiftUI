//
//  PostGridView.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
 @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    private let gridItems:[GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
               
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView( user: User.MOCK_USERS[0])
    }
}
