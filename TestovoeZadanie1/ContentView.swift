//
//  ContentView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct ContentView: View {
    enum FocusedField {
        case firstName, lastName
    }

    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var focusedField: FocusedField?
    @State var currentView = "Vhod1"
    
    var user = User(email: "wasd")
    var vacancies : [Vacancie] = Bundle.main.decode("VerySimpleData")
   

    var body: some View {
        
        var vacancie = vacancies[0]
        
        VStack {
            if currentView == "Vhod1"
            {
                Vhod1View()
            }
            
            if currentView == "Vhod2"
            {
                Vhod2View()
            }
            if currentView == "Glavnaya"
            {
                GlavnayaView()
            
            }
            if currentView == "VacanciePreviewView"
            {
                VacanciePreviewView(vacancie: vacancie, user: User(email: "wasd"))
            }
            HStack {
                Button("Vhod1") {
                    currentView = "Vhod1"
                }
                Button("Vhod2") {
                    currentView = "Vhod2"
                }
                Button("Glavnaya") {
                    currentView = "Glavnaya"
                }
                Button("VacanciePreviewView") {
                    currentView = "VacanciePreviewView"
                }
        }
    
            }
        
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(VhodViewModel())
            .environmentObject(GlavnayaViewModel())
    }
}
