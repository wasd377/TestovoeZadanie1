//
//  BottomMenuView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct BottomMenuView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    @EnvironmentObject var router: Router
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.basicGrey3)
    }
    
    var authorizedUser = false
    @State private var selectedTab: Int? = nil
    
    var body: some View {
    
            TabView {
                ZaglushkaView().tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
                }
                FavoritesView().tabItem {
                    Label("Избранное", systemImage: "heart")
                        .environment(\.symbolVariants, .none)
                }
                .badge(vm.favorites.count > 0 ? vm.favorites.count : 0)
                ZaglushkaView()
                    .tabItem {
                        VStack {
                            Text("Отклики")
                            Image(systemName: "envelope").renderingMode(.template)
                                .environment(\.symbolVariants, .none)
                        }
                    }
                ZaglushkaView()
                    .tabItem {
                        Label("Сообщения", systemImage: "message")
                            .environment(\.symbolVariants, .none)
                    }
                ZaglushkaView()
                    .tabItem {
                        Label("Профиль", systemImage: "person")
                            .environment(\.symbolVariants, .none)
                    }
            }
        
     
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
            .environmentObject(GlavnayaViewModel())
        
            
    }
}
