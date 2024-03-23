//
//  Glavnaya.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct GlavnayaView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    
    @State var searchText = ""
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
                    ForEach(vm.vacancies) { vacancie in
                        VacanciePreviewView(vacancie: vacancie, user: User(email:"wasd"))
                    }
                    .padding([.leading, .trailing], 16)
                    Button("Еще \(vm.vacancies.count) вакансии") {
                        vm.loadLocalData()
                    }
                    .buttonStyle(BigBlueButton(isDisabled: false))
                    .padding([.leading, .trailing], 16)
                }
                .onAppear{
                    vm.loadLocalData()
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
