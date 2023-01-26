//
//  ImageView.swift
//  SwitfUITutorial
//
//  Created by Juan on 26/1/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("rick").resizable().padding(50).frame(width: 300, height: 300).background(Color.gray).clipShape(Circle())
                .overlay(Circle()).shadow(color: Color.gray, radius: 5)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
