//
//  Favourites.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var vm : GlavnayaViewModel
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Group {
                Text("Избранное")
                    .foregroundColor(.basicWhite)
                    .font(.fontTitle2)
                    .padding(.bottom, 16)
                Group {if vm.favorites.count == 0 {
                    Text("0 вакансий") }
                    else if vm.favorites.count == 1 {
                        Text("\(vm.favorites.count)") + Text(" вакансия") }
                    else if (vm.favorites.count > 1) && (vm.favorites.count < 5)  {
                        Text("\(vm.favorites.count)") + Text(" вакансии") }
                    else if vm.favorites.count >= 5  {
                        Text("\(vm.favorites.count)") + Text(" вакансий") }
                }
                .foregroundColor(.basicGrey3)
                .font(.fontText1)
                .padding(.bottom, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView {
                VStack(spacing: 16) {
                    
                    ForEach(vm.vacancies) { vacancie in
                        if vm.favorites.contains(vacancie.id) {
                            VacancieCardView(vacancie: vacancie)
                        }
                    }
                }}
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear {
            vm.loadLocalData(email: vm.email)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var vacancies : [Vacancie] = Bundle.main.decode("SimpleData")
    static var vacancie = vacancies[1]
    static var favorites = [String]()
    
    static var previews: some View {
        FavoritesView()
            .environmentObject(GlavnayaViewModel())
        
    }
}
