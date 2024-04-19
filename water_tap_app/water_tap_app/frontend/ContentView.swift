//
//  ContentView.swift
//  water_tap_app
//
//  Created by Gary Mejia on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var responseData1: String = ""
    @State private var responseData2: String = ""
    
    var body: some View {
        VStack {
            // Test 1
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Test1 of our iPhone API")
                if responseData1.isEmpty {
                    Text("Loading...") // Show loading text while fetching data
                } else {
                    Text(responseData1.isEmpty ? "Bad request" : responseData1)
                }
            }
            
            // Start a new VStack for additional content
            VStack {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Test2 of our iPhone API")
                if responseData2.isEmpty {
                    Text("Loading...") // Show loading text while fetching data
                } else {
                    Text(responseData2.isEmpty ? "Bad request" : responseData2)
                }
            }.padding()
        }
        .onAppear {
            http_get_request_test1 { result in
                DispatchQueue.main.async {
                    self.responseData1 = result
                }
            }
            http_get_request_test2 { result2 in
                DispatchQueue.main.async {
                    self.responseData2 = result2
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestLogin()
    }
}

