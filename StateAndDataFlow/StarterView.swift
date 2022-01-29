//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct StarterView: View {
    @AppStorage("username", store: UserDefaults(suiteName: "StateAndDataFlow")) var nameInStorage = ""
    
    var body: some View {
        Group {
            if nameInStorage.count > 0 {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
