//
//  InfoWidget.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/30/20.
//

import SwiftUI

struct InfoWidget: View {
    @State var isInTestMode = testModeEnabled
    var body: some View {
        VStack{
            Text("Username: \"\(username)\" Appname: \"\(appname)\"" )
            Text("AppID: \"\(appID)\"")
            Text("ScreenH: \"\(ScreenH)\"  ScreenW: \"\(ScreenW)\" TestMode:\"\(String(isInTestMode))\"")
            Toggle(isOn: $isInTestMode){
                Text("Test Mode")
            }.onChange(of: isInTestMode){newValue in
                testModeEnabled = newValue
            }
        }
    }
}

struct InfoWidget_Previews: PreviewProvider {
    static var previews: some View {
        InfoWidget()
    }
}
