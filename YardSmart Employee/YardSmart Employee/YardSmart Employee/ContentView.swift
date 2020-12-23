//
//  ContentView.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import SwiftUI

var TopH:CGFloat = 80
var TopW:CGFloat = UIScreen.main.bounds.width

struct ContentView: View {
    var body: some View {
        NewJobWidget()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
