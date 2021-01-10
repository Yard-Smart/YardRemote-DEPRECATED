//
//  JobViewer.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI

struct JobViewer: View {
    var jobs: [Job]
    var body: some View {
        LazyVStack{
            ForEach(0 ..< jobs.count,id: \.self){num in
                addressPickerItem(address:self.addresses[num]).onTapGesture {
                    
                }.background(Color(UIColor.systemBackground).opacity(0.7))
                .cornerRadius(15)
            }
        }
    }
}

struct JobViewer_Previews: PreviewProvider {
    static var previews: some View {
        JobViewer()
    }
}
