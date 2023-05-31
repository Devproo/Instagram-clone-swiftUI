//
//  RegistrationViewModel.swift
//  instagram-clone
//
//  Created by ipeerless on 24/05/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async  throws{
     try await   AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
    
}
