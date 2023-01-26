//
//  ContentView.swift
//  SwitfUITutorial
//
//  Created by Juan on 25/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").font(.title).foregroundColor(.red).padding().background(Color .gray)
            
            Spacer()
            
            HStack{
                Text("SwitfUI").padding().background(Color .gray).padding()
                
                Spacer()
                
                Text("Tutorial").padding().background(Color .gray).padding()
            }
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
