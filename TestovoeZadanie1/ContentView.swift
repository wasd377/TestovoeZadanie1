//
//  ContentView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI


    struct ContentView: View {
        var body: some View {
                RouterView {
                       Vhod1View()
                }
            }
            
        }
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GlavnayaViewModel())
    }
}
