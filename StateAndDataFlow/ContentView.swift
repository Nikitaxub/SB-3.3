//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @AppStorage("username", store: UserDefaults(suiteName: "StateAndDataFlow")) var nameInStorage = ""
    
    var body: some View {
        VStack {
            Text("Hi, \(nameInStorage)")
                .font(.largeTitle)
                .padding(.top, 80)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 80)
            TimerButtonView(timer: timer)
                .padding(.top, 80)
            Spacer()
            LogoutButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct LogoutButtonView: View {
    @AppStorage("username", store: UserDefaults(suiteName: "StateAndDataFlow")) var nameInStorage = ""
    
    var body: some View {
        Button(action: logout) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
    
    private func logout() {
        nameInStorage = ""
    }
}
