//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct RegisterView: View {
    @AppStorage("username", store: UserDefaults(suiteName: "StateAndDataFlow")) var nameInStorage = ""
    @State private var name = ""
    @State private var loginUnavailable = true
    
    var body: some View {
        VStack {
            NameView(name: $name, loginUnavailable: $loginUnavailable)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
                .disabled(loginUnavailable)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            nameInStorage = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct NameView: View {
    @Binding var name: String
    @Binding var loginUnavailable: Bool
    @State private var countColor: Color = .red
    
    var body: some View {
        let nameBinding = Binding<String>(get: {
            name
        }, set: {
            name = $0
            countColor = name.count >= 3 ? .green : .red
            loginUnavailable = name.count >= 3 ? false : true
        })
        
        HStack {
            TextField("Enter your name", text: nameBinding)
                .multilineTextAlignment(.center)
            Text("0")
                .padding(.trailing)
                .foregroundColor(countColor)
        }
    }
}
