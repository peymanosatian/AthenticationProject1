//
//  SignInEmailView.swift
//  AthenticationProject1
//
//  Created by Peyman Osatian on 2024-08-26.
//

import SwiftUI
final class SignInEmailViewModel :  ObservableObject{
   @Published var email = ""
    @Published var password = ""
    
    func signIn(){
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password found")
            return
        }
        Task{
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print ("Success")
                print(returnedUserData)
            } catch {
               print ("Error :  \(error)")
            }
        }
    }
    
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack{
            TextField("Email ... ", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            // password
            
            SecureField("Your Password ", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            // Button
            Button{
                viewModel.signIn()
            }label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("SignIn with Email")
    }
}

#Preview {
    NavigationStack{
        SignInEmailView()
    }
}
