//
//  ContentView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var textField = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color(hex: 0x2B7EFE))
            Text("Hello, world!")
                .font(.fontTitle3)
        
            HStack{
                
                Button("Label") {}
                    .buttonStyle(BigBlueButton(isDisabled: false))
                
                Button("Label") {}
                    .buttonStyle(BigBlueButton(isDisabled: true))
            }
           
            TextField("Электронная почта или телефон", text: $textField)
                .foregroundColor(.white)
                
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
