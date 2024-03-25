//
//  TabBar.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 25.03.2024.
//

import SwiftUI

struct TabBarView: View {
    
    private var unselectedItem = [Color.basicGrey3, Color.basicGrey3, Color.basicGrey3, Color.basicGrey3, Color.basicGrey3]
    @State private var selectedItem = [Color.basicGrey3, Color.basicGrey3, Color.basicGrey3, Color.basicGrey3, Color.basicGrey3]
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var vm: GlavnayaViewModel
    
    var body: some View {
        VStack {
            Divider()
            HStack(alignment: .bottom) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 32))
                    Text("Поиск")
                        .font(.fontText1)
                }
                .foregroundColor(selectedItem[0])
                .onTapGesture {
                    
                    if vm.isAuthorized {
                        router.navigateTo(.glavnaya)
                        selectedItem = unselectedItem
                        selectedItem[0] = Color.specialBlue
                    }
                }
                Spacer()
                    ZStack {
                        VStack {
                            Image(systemName: "heart")
                                .font(.system(size: 32))
                            Text("Избранное")
                                .font(.fontText1)
                        }
                        if vm.favorites.count > 0 
                        { Text("\(vm.favorites.count)")
                                .font(.fontText1)
                                .foregroundColor(.basicWhite)
                                .padding(5)
                                .background(Color.specialRed)
                                .clipShape(Circle())
                                .offset(x:15, y: -20)
                        }
                        
                    }
                .foregroundColor(selectedItem[1])
                .onTapGesture {
                    if vm.isAuthorized {
                        router.navigateTo(.favorites)
                        selectedItem = unselectedItem
                        selectedItem[1] = Color.specialBlue
                    }
                }
                Spacer()
                VStack {
                    Image(systemName: "envelope")
                        .font(.system(size: 32))
                    Text("Отклики")
                        .font(.fontText1)
                }
                .foregroundColor(selectedItem[2])
                .onTapGesture {
                    if vm.isAuthorized {
                        router.navigateTo(.zaglushka)
                        selectedItem = unselectedItem
                        selectedItem[2] = Color.specialBlue
                    }
                }
                Spacer()
                VStack {
                    Image(systemName: "message")
                        .font(.system(size: 32))
                    Text("Сообщения")
                        .font(.fontText1)
                }
                .onTapGesture {
                    if vm.isAuthorized {
                        router.navigateTo(.zaglushka)
                        selectedItem = unselectedItem
                        selectedItem[3] = Color.specialBlue
                    }
                }
                .foregroundColor(selectedItem[3])
                Spacer()
                VStack {
                    Image(systemName: "person")
                        .font(.system(size: 32))
                    Text("Профиль")
                        .font(.fontText1)
                }
                .foregroundColor(selectedItem[4])
                .onTapGesture {
                    if vm.isAuthorized {
                        router.navigateTo(.zaglushka)
                        selectedItem = unselectedItem
                        selectedItem[4] = Color.specialBlue
                    }
                }
            }
            .padding([.top, .bottom],10)
            .padding([.leading, .trailing], 20)
            .frame(maxWidth: .infinity)
            .background(Color.basicBlack)
            .onAppear {
                selectedItem[vm.selectedTab] = Color.specialBlue
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(GlavnayaViewModel())
    }
}
