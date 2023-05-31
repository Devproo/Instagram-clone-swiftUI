//
//  CircularProfileImageView.swift
//  instagram-clone
//
//  Created by ipeerless on 24/05/2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
   case xsmall
    case small
    case large
    case xlarge
    var dimension: CGFloat {
        switch self {
        case .xsmall:
            return 40
        case .small:
            return 48
        case .large:
            return 64
        case .xlarge:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl  = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .large)
    }
}
