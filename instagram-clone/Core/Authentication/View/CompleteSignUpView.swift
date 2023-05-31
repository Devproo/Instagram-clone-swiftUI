//
//  CompleteSignUpView.swift
//  instagram-clone
//
//  Created by ipeerless on 22/05/2023.
//

import SwiftUI

struct CompleteSignUpView: View {
  @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Welcome to Instagram \(viewModel.username)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration")
                .font(.footnote)
         
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
          
          Button {
          
            Task   {try await viewModel.createUser()}
                   
            } label: {
                Text("Complete Sign Up ")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
         .padding(.vertical)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName:"chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                
            }
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
