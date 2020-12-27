//
//  PastJobsWidget.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI

var isUpdating : Bool = false

struct AddressesListView: View {
    var addresses: [Location]
  
  var body: some View {
    
      ForEach(addresses) {address in // (2)
        VStack(alignment: .leading) {
            Text(address.address)
            .font(.headline)
          Text(address.name)
            .font(.subheadline)
            Text("\(address.ownerID)  is owner")
            .font(.subheadline)
        }
      }
    }
}

struct refreshButton : View{
    var isUpdating: Bool
    var body: some View{
        Rectangle()
            .fill(isUpdating ? Color.blue :  Color.green)
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 60, idealHeight: 60, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text(isUpdating ? "Updating..." : "Refresh")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 40, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}


//struct PastJobsWidget: View {
//    @State private var search_string: String = ""
//    @State private var isExpanded: Bool =  false
//
//    var body: some View{
//        Rectangle()
//            .fill(Color(UIColor.systemFill))
//        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 60, idealHeight: 10, maxHeight: 100, alignment: .center)
//            .cornerRadius(50)
//        .overlay(
//            VStack{
//                TextField("Type Address", text: $search_string)
//                    .font(.system(size: 40, weight: .black, design: .default))
//                    .onChange(of: search_string) { newValue in
//                        print("Searching for Job: \(search_string)!")
//                        if self.search_string != ""{
//                            self.isExpanded = true
//                        }else{
//                            self.isExpanded = false
//                        }
//                    }
//
//            }.padding(15)
//        )
//        DisclosureGroup("", isExpanded: $isExpanded) {
//            ScrollView(.horizontal){
//                Rectangle()
//                    .fill(Color(UIColor.systemFill))
//                .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
//            }
//        }
//    }
//}

struct PastJobsWidget: View {
    @ObservedObject public var jobsSO = JobsViewModel()
    
    var body: some View{
        ScrollView{
            ZStack{
                Rectangle()
                .fill(Color(UIColor.systemFill))
                VStack{
                    JobsViewer(jobs: jobsSO.jobsDB).onAppear(){
                        jobsSO.getJobs()
                    }
                    
                    Button(action: {
                        isUpdating = true
                        jobsSO.getJobs()
                    }, label: {
                        refreshButton(isUpdating: isUpdating)
                    })
                }
            }
        }
    }
}

struct PastJobsWidget_Previews: PreviewProvider {
    static var previews: some View {
        PastJobsWidget()
        refreshButton(isUpdating: isUpdating)
    }
}
