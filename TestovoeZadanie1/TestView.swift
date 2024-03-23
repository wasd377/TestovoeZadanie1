//
//  TestView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 23.03.2024.
//

import SwiftUI

struct TestView: View {
    
    let userDefaults = UserDefaults.standard
    @State var favorites : [String] = []
    
    @State var schedules =  [
      "полная занятость",    "полный день"
    ]
    @State var newSchedules = [String]()
    
    var body: some View {
        
        //let newArray = schedules.map {$0.capitalized}
        let joined = schedules.joined(separator: ",")
        let joinedNew = newSchedules.joined(separator: ", ")
   
        VStack{
            Text(joined)
            Text(joinedNew)
            Button("Go!") {
            
            }
        }
        }
    

      
    }



extension String {
       var capitalizeFirstLetter:String {
            return self.prefix(1).capitalized + dropFirst()
       }
  }


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
