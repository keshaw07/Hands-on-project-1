//
//  Alert.swift
//  Appetizers
//
//  Created by Ram, Keshaw on 03/12/24.
//
import SwiftUI

struct AlertItem : Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissbutton: Alert.Button
}

struct AlertContex {
    static let invaildURL = AlertItem(title: Text("Server Error"),
                                             message: Text("The data received from server was invalid. please contact support"),
                                             dismissbutton: .default(Text("Ok")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from server .Please try again later or contact support"),
                                           dismissbutton: .default(Text("Ok")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                             message: Text("There was an issue connecting to server.PLease try to contact support"),
                                             dismissbutton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                           message: Text(" unable to complete your request at this time. please check you internet connection"),
                                           dismissbutton: .default(Text("Ok")))
    
    
    
    static let sampleinput = AlertItem(title: Text("Sample input"),
                                       message: Text("Sample test message"), dismissbutton: .default(Text("Ok")))
}
