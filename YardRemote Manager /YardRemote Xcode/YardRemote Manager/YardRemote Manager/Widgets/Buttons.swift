//
//  Buttons.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/20/20.
//

import SwiftUI

struct bigButton : View {
    var text: String
    var color: Color
    
    var body: some View {
        Rectangle()
        .fill(Color.green)
        .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text(text)
                        .foregroundColor(color)
                        .font(.system(size: 20, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}


struct Buttons: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
