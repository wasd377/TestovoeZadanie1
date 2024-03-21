//
//  BottomMenuView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct BottomMenuView: View {
    
    var authorizedUser = false
    
    var body: some View {
        
        if authorizedUser == false {
            
            TabView {
                Vhod1View()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                            .accentColor(.basicWhite)
                        Text("Поиск")
                           
                    }
                Vhod1View()
                    .tabItem {
                        Image(systemName: "heart")
                            .renderingMode(.template)
                            .foregroundStyle(.red)
                            .environment(\.symbolVariants, .none)
                        Text("Избранное")
                            
                            .foregroundColor(.basicGrey4)
                    }
                Vhod1View()
                    .tabItem {
                        Image("Envelope")
                            .renderingMode(.template)
                            .accentColor(.basicWhite)
                        Text("Отклики")
//                        Label("Отклики", systemImage: "envelope")
//                            .environment(\.symbolVariants, .none)
//                            .background(Color.basicGrey4)
                    }
                Vhod1View()
                    .tabItem {
                        Label("Сообщения", systemImage: "message")
                            .environment(\.symbolVariants, .none)
                    }
                Vhod1View()
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                            .environment(\.symbolVariants, .none)
                    }
            }
            
        } else {
            
            TabView {
                ContentView()
                    .tabItem {
                        Label("Поиск", systemImage: "magnifyingglass")
                    }
                ContentView()
                    .tabItem {
                        Label("Избранное", systemImage: "heart")
                            .environment(\.symbolVariants, .none)
                    }
                ContentView()
                    .tabItem {
                        Label("Отклики", systemImage: "envelope")
                            .environment(\.symbolVariants, .none)
                    }
                ContentView()
                    .tabItem {
                        Label("Сообщения", systemImage: "message")
                            .environment(\.symbolVariants, .none)
                    }
                ContentView()
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                            .environment(\.symbolVariants, .none)
                    }
            }
        }
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            
    }
}
