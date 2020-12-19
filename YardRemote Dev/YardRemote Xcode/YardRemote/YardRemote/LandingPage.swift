//
//  LandingPage.swift
//  Let Me Know
//
//  Created by Felipe Galindo on 11/29/20.
//

import SwiftUI

//vasiables for the size of the top bar
var TopH:CGFloat = 80
var TopW:CGFloat = 490




//Top bar
struct LandingPageTop: View {
    var body: some View {
        Rectangle()
        .fill(Color(UIColor.systemBlue))
        .frame(width: TopW, height: TopH)
        .overlay(
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("YardRemote")
                    .font(.system(size: 38, weight: .black, design: .default))
                    
                Spacer()
            }
        }
        )
    }
}

struct Schedule: View {
    var body: some View {
        VStack{
            
        }
    }
}




struct staffWidget: View {
    var body: some View {
        VStack{
            felpieWidget()
        }
    }
}

struct felpieWidget: View {
    var body: some View {
        HStack {
            VStack{
                HStack{
                    Text("Felipe Galindo")
                        .font(.system(size: 24, weight: .black, design: .default))
                    Spacer()
                }
                HStack {
                    Text("Software Engineer")
                        .fontWeight(Font.Weight.black)
                    Spacer()
                }
                HStack {
                    Button("(628)-222-4642") {UIApplication.shared.open(URL(string: "https://google.com")!)}
                    Spacer()
                }
                HStack {
                    Button("felipht@hotmail.com") {UIApplication.shared.open(URL(string: "https://google.com")!)}
                    Spacer()
                }
                
            }
            Image("felpie").resizable()
                .frame(width: 120, height: 92, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct dannyWidget: View {
    var body: some View {
        VStack{
            
        }
    }
}

struct alteWidget: View {
    var body: some View {
        VStack{
            
        }
    }
}
//Account Detail
struct accountDetail : View {
    var accountInfo: AccountData
    var body: some View {
        VStack{
            Text("no worko ur account")
        }
    }
}

//Account overview
struct overviewWidget: View {
    var accountInfo: AccountData
    var body: some View {
        HStack() {
            Spacer()
            Rectangle()
                .fill(Color.blue)
                .frame(minWidth: 100, idealWidth: 600, maxWidth: 600, minHeight: 100, idealHeight: 200, maxHeight: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(15)
            .overlay(
                
                VStack {
                    HStack {
                        Text(accountInfo.ownerName).padding(5)
                            .font(.system(size: 36, weight: .black, design: .default))
                        Spacer()
                    }.background(Color.gray.opacity(0.7))
                    .cornerRadius(15)
                    
                    
                    HStack {
                        Group{
                            Text("Balance Due: ")
                                .fontWeight(Font.Weight.black)
                            Text(accountInfo.amountDue)
                                .fontWeight(Font.Weight.light)
                                .italic()
                        }
                       
                        Spacer()
                        VStack(){
                            Text("Due")
                                .fontWeight(Font.Weight.heavy)
                            Text(accountInfo.dueDate)
                                .fontWeight(Font.Weight.thin)
                                .italic()
                        }
                    }.padding(5)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    Spacer()
                }
            )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct addressWidget: View {
    var addr: AddressData
    var body: some View {
        HStack() {
            Spacer()
            Rectangle()
                .fill(Color.blue.opacity(0.7))
                .frame(width: 310, height: 150)
            .cornerRadius(15)
            .overlay(
                VStack {
                    HStack {
                        Text(addr.Address)
                            .font(.system(size: 26, weight: .black, design: .default))
                        Spacer()
                    }
                    Spacer()
                }
            .padding(5)
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Text("Last Service: ")
                            .fontWeight(Font.Weight.black)
                        Text(addr.billHistory[0].title)
                            .fontWeight(Font.Weight.light)
                            .italic()
                        Spacer()
                        VStack(){
                            Text("date:")
                                .fontWeight(Font.Weight.heavy)
                            Text(addr.billHistory[0].date)
                                .fontWeight(Font.Weight.thin)
                                .italic()
                        }
                    .padding(5)

                    }
                    .padding(5)
                }
            ).foregroundColor(Color(UIColor.label))            )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct addressDetail : View {
    var addr :AddressData
    var body: some View {
        VStack{
            Text("no worko")
        }
    }
}

struct addressesWidget: View {
    var addrs :[AddressData]
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(addrs){ addr in
                    NavigationLink(destination: addressDetail(addr: addr)) {addressWidget(addr: addr)}
            }
        }
    }
}
}

struct billWidget: View {
    var bill: Bill

    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(minWidth: 180, idealWidth: 100, maxWidth: 200, minHeight: 100, idealHeight: 150, maxHeight: 200, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack {
                        Text(bill.title)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 20, weight: .black, design: .default))
                        Spacer()

                    }
                    Text(bill.messages[0].title)
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    Text(bill.messages[0].message)
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 16, weight: .heavy, design: .default))
                    Spacer()
                    HStack {

                        Text("⏱: "+bill.time)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 16, weight: .black, design: .default))
                        Spacer()
                        Text("💲: "+bill.amount)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 16, weight: .black, design: .default))
                    }.ignoresSafeArea(.all)
                        
                }.padding(5)
                
            )
    }
}

struct billsWidget: View {
    var accountInfo: AccountData
//    let messages =
//    for address in accountInfo.address { }
    
    var body: some View {
        VStack{
            ForEach(accountInfo.address){address in
                ForEach(address.billHistory){bill in 
                    billWidget(bill: bill)
                }
            }
        }
    }
}
struct actionOverview: View {
    var action: Action
    var body: some View{
        Rectangle()
            .fill(Color.gray)
            .frame(minWidth: 180, idealWidth: 100, maxWidth: 200, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack {
                        Text(action.name)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 20, weight: .black, design: .default))
                        Spacer()

                    }
                    HStack {
                        Text(action.avaliability)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 16, weight: .heavy, design: .default))

                    }
                    Spacer()
                    HStack {

                        Text("⏱: "+action.executionTime)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 16, weight: .black, design: .default))
                        Spacer()
                        Text("💲: "+action.executionTime)
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 16, weight: .black, design: .default))
                    }.ignoresSafeArea(.all)
                        
                }.padding(5)
                
            )
            
    }
}

//struct quickActionItem: View {
//    var action: action
////    let messages =
////    for address in accountInfo.address { }
//
//    var body: some View {
//        HStack() {
//            Spacer()
//            Rectangle()
//                .fill(Color.blue.opacity(0.6))
//                .frame(minWidth: 150, idealWidth: 100, maxWidth: 300, minHeight: 300, idealHeight: 100, maxHeight: 300, alignment: .leading)
//
//            .padding(5)
//            .overlay(
//                VStack {
//                    HStack {
//                        Text(action.name)
//                            .font(.system(size: 16, weight: .black, design: .default))
//                        Spacer()
//                    }
//                    Spacer()
//                    Spacer()
//                    HStack{
//                        Text("Time to Complete:")
//                            .font(.system(size: 10, weight: .black, design: .default))
//                        Text(action.executionTime)
//                            .fontWeight(Font.Weight.light)
//                            .italic()
//                    }
//                    HStack(){
//                        Text("Aprox Price:")
//                            .font(.system(size: 10, weight: .black, design: .default))
//                        Text(action.executionCost)
//                            .fontWeight(Font.Weight.thin)
//                            .italic()
//                    }
//                    Spacer()
//                }
//                )
//        }
//    }
//}

struct actionDetail : View {
    var action : Action
    var body: some View {
        VStack{
            Text(action.name)
            Text("no worko")
        }
    }
}
struct messageOverview: View {
    var message : Message
    var body: some View {
        HStack() {
            Spacer()
            Rectangle()
                .fill(Color.blue.opacity(0.6))
                .frame(minWidth: 100, idealWidth: 200, maxWidth: 300, minHeight: 100, idealHeight: 200, maxHeight: 300, alignment: .leading)
            .cornerRadius(15)
            .overlay(
                VStack {
                    HStack {
                        Text(message.title)
                            .font(.system(size: 16, weight: .black, design: .default))
                        Spacer()
                    }
                    HStack {
                        Text("From: "+message.senderUID)
                            .font(.system(size: 11, weight: .black, design: .default))
                        Spacer()

                    }
                    Text(message.message)
                    Spacer()
                }
            .padding(5)
            )
        }.foregroundColor(Color(UIColor.label))
        .edgesIgnoringSafeArea(.top)
    }
}
struct messageDetail : View {
    var message : Message
    var body: some View {
        VStack{
            Text(message.title)
            Text("no worko")
        }
    }
}
struct messagesOverview: View {
    var messages : [Message]
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: rows, alignment: .center){
                ForEach(messages){message in
                    NavigationLink(destination: messageDetail(message: message)){messageOverview(message: message)}
                }
            }
        }
    }
}

//struct actionsWidget: View {
//    var actions :[action]
////    let columns = [
////        GridItem(.flexible()),
////        GridItem(.flexible())
////    ]
//    var body: some View {
////        LazyVGrid(columns: columns){
////            ForEach(actions){action in
////                NavigationLink(destination: actionDetail(action: action)){
////                    quickActionItem(action:action)
////                }
////            }
//        VStack{
//            ForEach(actions){action in
//                Spacer()
//                NavigationLink(destination: actionDetail(action: action)){
//                    quickActionItem(action:action)
//                }
//            }
//        }
//    }
//}

struct actionsWidget: View {
    var actions :[Action]
    var body: some View {
        ScrollView(.horizontal){
            ForEach(actions){action in
                NavigationLink(destination: actionDetail(action: action )){actionOverview(action: action)}
                Spacer();
            }
        }
    }
}

struct addressPickerItem: View {
    var address: AddressData
    
    var body: some View {
        Text(address.name)
            .fontWeight(Font.Weight.black)
            .padding(15)
            
    }
}
                


struct quickActionsWidget : View {
    var addresses: [AddressData]
    @State private var selectedAddress = 0
    @State private var isExpanded = false
    var body: some View {
        VStack{
            VStack{
                DisclosureGroup(addresses[selectedAddress].Address, isExpanded: $isExpanded) {
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0 ..< addresses.count,id: \.self){num in
                                addressPickerItem(address:self.addresses[num]).onTapGesture {
                                    self.selectedAddress = num
                                    self.isExpanded.toggle()
                                }.background(Color(UIColor.systemBackground).opacity(0.7))
                                .cornerRadius(15)
                            }
                            Spacer()
                        }
                    }
                }.overlay(VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        if !self.isExpanded {Text("Click here to change address").font(.footnote)}
                        else {Text("").font(.footnote)}
                        
                    }
                })
            }.onTapGesture {
                self.isExpanded.toggle()
            }.accentColor(Color(UIColor.label))
            .font(.title2)
            .foregroundColor(Color(UIColor.label))
            .padding(15)
            .background(Color.blue.opacity(0.8))
            .cornerRadius(15)
            Spacer()
            actionsWidget(actions: addresses[selectedAddress].avaliableActions)
        }
        
    }
}

struct sendFeedbackPage: View {

    var body: some View{
        VStack{
            Rectangle()
            .fill(Color.gray)
            .frame(minWidth: 80, idealWidth: 100, maxWidth: 400, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack {
                        Text("Send Feedback")
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 20, weight: .black, design: .default))

                    }
                        
                }.padding(5)
                
            )
            Spacer()
        }
    }
}
    
struct sendFeedbackBotton: View {
    
    var body: some View{
        NavigationLink(destination: sendFeedbackPage()){
            Rectangle()
            .fill(Color.gray)
            .frame(minWidth: 180, idealWidth: 400, maxWidth: 400, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack {
                        Text("Send Feedback")
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 20, weight: .black, design: .default))

                    }
                        
                }.padding(5)
                
            )}
        
    }
}

struct LandingPage: View {
    var accountInfo: AccountData
    var body: some View {
        VStack {
            Rectangle()
            .frame(width: TopW, height: TopH-50).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationView {
                List() {
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Quick Actions")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        quickActionsWidget(addresses: accountInfo.address)
                    }
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Account Overview")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        NavigationLink(destination: accountDetail(accountInfo: accountInfo) ){overviewWidget(accountInfo: tstAccount)}
                    }
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("New Messages")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        messagesOverview(messages: accountInfo.messages)
                    }
                    
                    
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Your Bills")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        billsWidget(accountInfo: tstAccount)
                    }
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Your Properties")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        addressesWidget(addrs: accountInfo.address)
                    }
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Contact Info")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        staffWidget()
                    }
                    
                    Section() {
                        sendFeedbackBotton()
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarHidden(true)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .overlay(VStack {
            LandingPageTop().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        })
        
    }
}




struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage(accountInfo: tstAccount)
    }
    }

