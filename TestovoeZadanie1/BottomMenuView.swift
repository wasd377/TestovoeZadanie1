//
//  BottomMenuView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct BottomMenuView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    @EnvironmentObject var vmVhod: VhodViewModel
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.basicGrey3)
    }
    
    var authorizedUser = false
    
    var body: some View {
        
        
            
        TabView {
            Group {
                Vhod1View().tabItem {
                        Label("Поиск", systemImage: "magnifyingglass")
                }
                FavoritesView().tabItem {
                        Label("Избранное", systemImage: "heart")
                            .environment(\.symbolVariants, .none)
                }
                .badge(vm.favorites.count > 0 ? vm.favorites.count : 0)
                Vhod1View()
                    .tabItem {
                        VStack {
                            Text("Отклики")
                            Image(systemName: "envelope").renderingMode(.template)
                                .environment(\.symbolVariants, .none)
                        }
                    }
                Vhod1View()
                    .tabItem {
                        Label("Сообщения", systemImage: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                    }
                Vhod1View()
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
            .environmentObject(GlavnayaViewModel())
            .environmentObject(VhodViewModel())
            
    }
}
