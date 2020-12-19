//
//  OverviewWidget.swift
//  Let Me Know
//
//  Created by Felipe Galindo on 11/29/20.
//

import SwiftUI

var widgetW: CGFloat = 400
var widgetH: CGFloat = 300

struct OverviewWidget: View {
    var accountData: AccountData
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: widgetW, height: widgetH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(15)
    .overlay(
        HStack {
            VStack(alignment: .leading, spacing: 10){
                VStack {
                    Text("Welcome Back")
                        .font(Font.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(accountData.ownerName)
                        .font(Font.title)
                }.padding(5)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(20)
                
                HStack {
                    VStack {
                        Text("Amount Due")
                            .font(Font.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(accountData.amountDue)
                            .font(Font.title)
                    }
                    
                    VStack {
                        Text("Due Date")
                            .font(Font.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(accountData.dueDate)
                            .font(Font.title)
                    }
                }.padding(5)
                .background(Color.black.opacity(0.2))
                .cornerRadius(20)
                
                HStack {
                    VStack {
                        Text("Latest Visit")
                            .font(Font.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(accountData.amountDue)
                            .font(Font.title)
                    }
                    
                    VStack {
                        Text("Reason")
                            .font(Font.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(accountData.dueDate)
                            .font(Font.title)
                    }
                }.padding(5)
                .background(Color.black.opacity(0.2))
                .cornerRadius(20)
                
                Spacer()
            }.padding(5)
            Spacer()
        }
    )
        
    }
}

struct OverviewWidget_Previews: PreviewProvider {
    static var previews: some View {
        OverviewWidget(accountData:tstAccount)
    }
}
