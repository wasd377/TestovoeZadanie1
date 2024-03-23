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
    
    func loadFavorites() {
        var savedFavorites = UserDefaults.standard.array(forKey: "wasd") as? [String]
        favorites = savedFavorites ?? []
        
    }
   
    func simpleAdd() {
        var favorite = "abrams25"
        favorites.append(favorite)
        UserDefaults.standard.removeObject(forKey: "wasd")
        UserDefaults.standard.set(favorites, forKey: "wasd")
    }
    
    func simpleRemove() {
        var favorite = "abraham"
        favorites = favorites.filter{$0 != favorite}
        UserDefaults.standard.set(favorites, forKey: "wasd")
    }
    
    
    var body: some View {
        VStack {
            Button("Add") {
                simpleAdd()
            }
            Button("Remove") {
                simpleRemove()
            }
       
            var savedString = favorites.joined(separator: ", ")
            
            if favorites != nil {
                Text(savedString)
            } else {
                Text("pustota")
            }
            
        }
        .onAppear {
            loadFavorites()
        }
      
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
