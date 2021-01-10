//
//  ServiceLogos.swift
//  YardRemote Dev
//
//  Created by Felipe Galindo on 1/3/21.
//

import SwiftUI

struct ServiceLogos: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LawnCareLogo: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.green)
            .frame(minWidth: 50, idealWidth: 80, maxWidth: 80, minHeight: 30, idealHeight: 50, maxHeight: 100, alignment: .center)
            .cornerRadius(10)
            VStack{
                HStack {
                    Text("Lawn Care")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 12, weight: .black, design: .default))
                }
            }.padding(5)
        }
    }
}
struct SnowRemovalLogo: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.blue)
            .frame(minWidth: 50, idealWidth: 120, maxWidth: 120, minHeight: 30, idealHeight: 50, maxHeight: 100, alignment: .center)
            .cornerRadius(10)
            VStack{
                HStack {
                    Text("Snow Removal")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 12, weight: .black, design: .default))
                }
            }.padding(5)
        }
    }
}
struct ServiceLogos_Previews: PreviewProvider {
    static var previews: some View {
        ServiceLogos()
    }
}
