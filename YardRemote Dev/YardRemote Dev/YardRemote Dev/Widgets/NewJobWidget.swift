//
//  NewJobWidget.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI
import FirebaseFirestore

private var isReady: Bool = false
private var inJob: Bool = false
var employeeID = "Felipe"


struct startStopButton : View {
    var isStarted: Bool
    var isReady: Bool
    var body: some View {
        Rectangle()
            .fill(isReady ? (isStarted ? Color.red :  Color.green) : Color.blue)
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text(isReady ? (isStarted ? "END" : "START"): "READY")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 80, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}

func getFormatedDate(date: Date) -> String {
    if !inJob {
        return "-:-:-"
    }

    return "\(calendar.component(.hour, from: date)):\(calendar.component(.minute, from: date)):\(calendar.component(.second, from: date))"
}

func format(duration: TimeInterval) -> String {
    if !inJob {
        return "-"
    }
    
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute, .second]
    formatter.unitsStyle = .abbreviated
    formatter.maximumUnitCount = 4

    return formatter.string(from: duration)!
}

struct currentJobTimer: View {
    func findDateDiff(startTimeStr: String, endTimeStr: String) -> String {
        let startTime =  Date(timeIntervalSince1970: (TimeInterval(startTimeStr) ?? TimeInterval(String(Date().timeIntervalSince1970)))!)
        let interval = Date().timeIntervalSince(startTime)
        let hour = interval / 3600;
        let minute = interval.truncatingRemainder(dividingBy: 3600) / 60
        let second = (interval.truncatingRemainder(dividingBy: 3600)).truncatingRemainder(dividingBy: 60) / 60
        let intervalInt = Int(interval)
        return "\(intervalInt < 0 ? "-" : "+") \(Int(hour)) Hours \(Int(minute)) Minutes \(Int(second)) Seconds"
        
    }
    var job: Job
    var body: some View {
        LazyVStack{
            //Top line
            ZStack{
                VStack{
                    Capsule()
                        .frame(minWidth: 50, idealWidth: ScreenW-50, maxWidth: ScreenW-20, minHeight: 5, idealHeight: 10, maxHeight: 10, alignment: .center)
                    HStack{
                        VStack{
                            Text(getFormatedDate(date: Date(timeIntervalSince1970: TimeInterval(job.startTime)!)))
                            Text("Start").foregroundColor(.gray)
                        }
                    
                        Spacer()
                        
                        VStack{
                            //Text(getFormatedDifference(date: Date(timeIntervalSince1970: TimeInterval(job.startTime) ?? Date().timeIntervalSince1970)))
//                            Text(getFormatedDifference(startTime: job.startTime))
//                            Text(findDateDiff(startTimeStr: job.startTime, endTimeStr: job.endTime))
                            Text(format(duration: (TimeInterval(job.endTime)!-TimeInterval(job.startTime)!)))
                            Text("Time Spent").foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text(getFormatedDate(date: Date(timeIntervalSince1970: TimeInterval(job.endTime)!)))
                            Text("End").foregroundColor(.gray)
                        }
                    }
                }
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(UIColor.systemFill))
            }
        }
    }
}

func saveJob(job: Job){
    do {
        let _ = try db.collection("Jobs").addDocument(from: job)
      }
      catch {
        print(error)
      }
    return
}

struct NewJobWidget: View {
    @State private var mapHeight: CGFloat = 400
    @State var job: Job = Job(id: UUID().uuidString, startTime: String(Date().timeIntervalSince1970), endTime: String(Date().timeIntervalSince1970), locationID: "-", isDone: false, hasStarted: false, employeeIDs: [employeeID], messages: [Message(id: UUID().uuidString, timeSent: String(Date().timeIntervalSince1970), senderID: "app", recipientID: "server", title: "", message: "")])

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }


    var body: some View {
        VStack{
            currentJobTimer(job: job)
            
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(UIColor.systemFill))
                
                VStack{
                    Text("Enter Notes")
                    TextEditor(text: $job.messages[0].message)
                        .frame(minWidth: ScreenW/2, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: ScreenH/5, idealHeight: ScreenH/5, maxHeight: ScreenH/3, alignment: .center)
                }
            }
            
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 10, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Address", text: $job.locationID)
                        .font(.system(size: 40, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            
            NavigationLink(destination: EmployeesListPicker(selectedIDs: $job.employeeIDs)){
                smallButton(text: "See Employees", color: Color.red)
            }
            
            
            
            startStopButton(isStarted: inJob, isReady: isReady)
                .onTapGesture {
                        if !isReady { //If you were not ready, then ready up
                            isReady = true
                    }else{
                        if inJob {//If in job then save the current Job, push to the cloud, then reset
                            isReady = false
                            inJob = false
                            job.endTime = String(Date().timeIntervalSince1970)
                            saveJob(job: job)
                            //reset Job
                            job = Job(id: UUID().uuidString, startTime: String(Date().timeIntervalSince1970), endTime: String(Date().timeIntervalSince1970), locationID: "-", isDone: false, hasStarted: false, employeeIDs: [], messages: [Message(id: UUID().uuidString, timeSent: String(Date().timeIntervalSince1970), senderID: "app", recipientID: "server", title: "", message: "")])

                            
                        }else{   //If you were ready and were not in a job now then start a job
                            inJob = true
                            job.startTime = String(Date().timeIntervalSince1970)
                            job.hasStarted = true
                        }
                    }
                }
        }.onReceive(timer, perform: { _ in
            job.endTime = String(Date().timeIntervalSince1970)
        })
    }
}

struct NewJobWidget_Previews: PreviewProvider {
    static var previews: some View {
        Text("noworko")
    }
}
