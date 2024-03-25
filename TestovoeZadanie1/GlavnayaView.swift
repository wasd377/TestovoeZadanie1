//
//  Glavnaya.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct GlavnayaView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    @EnvironmentObject var router: Router
    
    @State var searchText = ""
    @State var showAllVacancies = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.basicGrey4)
                        .padding(.leading)
                    TextField("Должность, ключевые слова", text: $searchText, prompt: Text("Должность, ключевые слова").foregroundColor(.basicGrey4))
                        .textFieldStyle(.plain)
                        .foregroundColor(.basicWhite)
                        .padding(10)
                        .font(.fontText1)
                        .textFieldStyle(.roundedBorder)
                }
                .background(Color.basicGrey1)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                )
                HStack{
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.basicGrey4)
                        .padding(10)
                }
                
                .background(Color.basicGrey1)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .padding(.bottom, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    VStack(alignment: .leading){
                        ZStack {
                            Circle()
                                .fill(Color.specialDarkBlue)
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.specialBlue)
                        }
                        .padding(.bottom, 16)
                        Text("Вакансии\nрядом с вами")
                            .foregroundColor(.basicWhite)
                            .font(.fontTitle4)
                    }
                    .padding(.leading, 8)
                    .padding(.top, 10)
                    .frame(width: 150, height: 130, alignment: .topLeading)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
                    VStack(alignment: .leading){
                        ZStack {
                            Circle()
                                .fill(Color.specialDarkGreen)
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: "star")
                                .foregroundColor(.specialGreen)
                        }
                        .padding(.bottom, 16)
                        Group {
                            Text("Поднять резюме в поиске")
                                .foregroundColor(.basicWhite)
                                .font(.fontTitle4)
                                .frame(width:120)
                            Text("Поднять")
                                .font(.fontTitle4)
                                .foregroundColor(.specialGreen)
                        }
                        
                    }
                    .padding(.leading, 8)
                    .padding(.top, 10)
                    .frame(width: 150, height: 130, alignment: .topLeading)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
                    VStack(alignment: .leading){
                        ZStack {
                            Circle()
                                .fill(Color.specialDarkGreen)
                                .frame(width: 32, height: 32)
                            Image(systemName: "list.bullet.clipboard")
                                .foregroundColor(.specialGreen)
                        }
                        .padding(.bottom, 16)
                        Text("Временная \nработа и подработка")
                            .foregroundColor(.basicWhite)
                            .font(.fontTitle4)
                    }
                    .padding(.leading, 8)
                    .padding(.top, 10)
                    .frame(width: 150, height: 130, alignment: .topLeading)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
            
            Text("Вакансии для вас")
                .foregroundColor(.basicWhite)
                .font(.fontTitle2)
                .padding(.top, 16)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Group {
                        if showAllVacancies == false {
                            ForEach(vm.vacancies.prefix(3)) { vacancie in
                                    VacancieCardView(vacancie: vacancie)
                                Button("Открыть") {
                                    router.navigateTo(.zaglushka)
                                }
                            }
                        } else {
                            ForEach(vm.vacancies) { vacancie in
                                    VacancieCardView(vacancie: vacancie)
//                                    .onTapGesture {
//                                        router.navigateTo(.vacancie(vacancie))
//                                    }
                            }
                        }
                    }
                    .padding([.leading, .trailing], 16)
                    
                    Button {
                    } label: {
                  if vm.vacancies.count == 1 {
                      Text("Еще \(vm.vacancies.count) вакансия") } else if vm.vacancies.count > 1 && vm.vacancies.count < 5 {
                          Text("Еще \(vm.vacancies.count) вакансии") } else {
                              Text("Еще \(vm.vacancies.count) вакансий") }
                     
                    }
                    .buttonStyle(BigBlueButton(isDisabled: false))
                    .padding([.leading, .trailing], 16)
                    
                    if vm.isLoadingData == true {
                        Spacer().frame(height: 100)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    }
                }
                .onAppear {
                    Task {
                        do {
                            try await vm.loadData(email: vm.email)
                        } catch {
                            print("Error", error)
                        }
                    }
                }
            
            
            
        }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct Glavnaya_Previews: PreviewProvider {
    static var previews: some View {
        GlavnayaView()
            .environmentObject(GlavnayaViewModel())
    }
}
