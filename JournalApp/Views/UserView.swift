//
//  AccountFormView.swift
//  JournalApp
//
//  Created by Justin Bell on 4/9/25.
//

import SwiftUI

struct UserView: View {
    @FocusState var isInputActive : Bool
    @State var email: String = ""
    @State var password: String = ""
    @State var isSuccessful: Bool = false
    @StateObject var user = UserViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Email:")
                        .font(.system(size: 25))
                    TextField("Email", text: $email)
                        .focused($isInputActive)
                        .border(Color.gray)
                }
                HStack {
                    Text("Password:")
                        .font(.system(size: 25))
                    TextField("Password", text: $password)
                        .focused($isInputActive)
                        .border(Color.gray)
                }
                HStack {
                    Button(action:  {
                        user.createUser(email: email, password: password)
                        isSuccessful = true
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .border(Color.blue)
                            .background(Color.blue)
                    })
                    Button {
                        user.signIn(email: email, password: password)
                        isSuccessful = true
                        print(isSuccessful)
                    } label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .border(Color.blue)
                            .background(Color.blue)
                    }
                }
                .padding()
                HStack {
                    NavigationLink(destination: JournalView()) {
                        Text("View Journal")
                    }
                    .foregroundColor(.white)
                    .border(Color.blue)
                    .background(Color.blue)
                    .font(.system(size: 25))
                    .padding(.trailing, 50)
                    .opacity(isSuccessful ? 1 : 0)
                }
            }
        }
        
        //    func getDestination(email: String, password: String) -> some View {
        //        isSuccessful = user.createUser(email: email, password: password)
        //        if (isSuccessful) {
        //            return JournalView()
        //        }
        //        else {
        //            return UserView()
        //        }
        //    }
    }
}



#Preview {
    UserView()
}
