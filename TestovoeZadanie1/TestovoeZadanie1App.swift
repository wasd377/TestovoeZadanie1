//
//  TestovoeZadanie1App.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

@main
struct TestovoeZadanie1App: App {
    var body: some Scene {
        
        
        WindowGroup {
           ContentView()
                .environmentObject(GlavnayaViewModel())
        }
    }
}
