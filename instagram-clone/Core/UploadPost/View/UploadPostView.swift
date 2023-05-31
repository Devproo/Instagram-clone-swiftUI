//
//  UploadPostView.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State  private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                  clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {  try await viewModel.uploadPost(caption:caption)
                        clearPostDataAndReturnToFeed()
                    }
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

                
            }
            .padding(.horizontal)
            HStack(spacing: 8){
                if let image = viewModel.postImage {
                    image .resizable() .frame(width: 100, height: 100) .scaledToFill() .clipped()
                }
                TextField("Enter your caption...", text: $caption, axis: .vertical)
                
            }
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    func clearPostDataAndReturnToFeed(){
        caption=""
         viewModel.selectedImage = nil
         viewModel.postImage = nil
         tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView( tabIndex: .constant(0))
    }
}
