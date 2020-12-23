//
//  NewJobWidget.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI

struct startButton : View {
    var body: some View {
        Rectangle()
        .fill(Color.green)
        .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text("START")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 80, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}

struct NewJobWidget: View {
    @State private var mapHeight: CGFloat = 400
    @State private var n_employees = 5.0
    @State private var address = ""
    @State private var isEditing = false
    var body: some View {
        VStack{
            MapView()
                .frame(minWidth: 100, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: mapHeight, maxHeight: mapHeight, alignment: .center)
                .cornerRadius(10)
                .onTapGesture {
                    if self.mapHeight == TopW{
                        self.mapHeight = TopW*2
                    }
                    else{
                        self.mapHeight = TopW
                    }
                }
            locationInfoWidget()
            
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 10, idealHeight: 10, maxHeight: 80, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                        Slider(
                            value: $n_employees,
                            in: 0...5,
                            step: 1,
                            onEditingChanged: { editing in
                                isEditing = editing
                            },
                            minimumValueLabel: Text("0"),
                            maximumValueLabel: Text("5")
                        ) {
                        }
                    Text("Will mark as using \(Int(n_employees)) employees")
                            .foregroundColor(isEditing ? .red : .blue)
                    
                    HStack {
                        
                            

                    }
                    .foregroundColor(Color(UIColor.label))
                    
                    .font(.system(size: 18, weight: .black, design: .default))
                        
                }.padding(5)
                
            )
            
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 10, idealHeight: 10, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Address", text: $address)
                        .font(.system(size: 40, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            
            startButton()
        }
    }
}

struct NewJobWidget_Previews: PreviewProvider {
    static var previews: some View {
        NewJobWidget()
    }
}
