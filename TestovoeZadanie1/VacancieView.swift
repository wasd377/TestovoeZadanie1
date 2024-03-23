//
//  VacancieView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct VacancieView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.basicWhite)
                    .font(.system(size:24))
                Spacer()
                Image(systemName: "eye")
                    .foregroundColor(.basicWhite)
                    .font(.system(size:24))
                Image("Share")
                    .foregroundColor(.basicWhite)
                    .font(.system(size:24))
                Image(systemName: "heart")
                    .foregroundColor(.basicWhite)
                    .font(.system(size:24))
            }
            .padding(.bottom, 16)
            Group {
                Text("UX Designer")
                    .font(.fontTitle1)
                    .padding(.bottom, 12)
                Text("уровень дохода")
                    .font(.fontText1)
                    .padding(.bottom, 12)
                Text("Требуемый опыт")
                    .font(.fontText1)
                .padding(.bottom, 4)
                Text("Занятость")
                    .font(.fontText1)
            }
            .foregroundColor(.basicWhite)
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HStack {
                        HStack(alignment: .top) {
                            Text("147 человек уже откликнулись")
                            Spacer()
                            Image(systemName: "person")
                                .font(.system(size:14))
                                .foregroundColor(.basicWhite)
                                .background {
                                    Circle()
                                        .fill(Color.specialGreen)
                                        .frame(width: 24, height: 24)
                                }
                        }
                        .padding()
                        .foregroundColor(.basicWhite)
                        .frame(maxWidth: .infinity)
                        .background(Color.specialDarkGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                        HStack(alignment: .top) {
                            Text("2 человека сейчас смотрят")
                            Spacer()
                            Image(systemName: "eye")
                                .font(.system(size:14))
                                .foregroundColor(.basicWhite)
                                .background {
                                    Circle()
                                        .fill(Color.specialGreen)
                                        .frame(width: 24, height: 24)
                                }
                        }
                                .foregroundColor(.basicWhite)
                                .padding([.top, .bottom], 16)
                                .frame(maxWidth: .infinity)
                                .padding([.leading, .trailing], 16)
                                .background(Color.specialDarkGreen)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                    }
                    Text("Название компании")
                    Image(systemName: "map")
                    Text("адрес компании")
                    Text("описание компании")
                    Text("Ваши задачи")
                        .font(.fontTitle2)
                        .foregroundColor(.basicWhite)
                    Text("Описание задач")
                    Text("Задайте вопрос работодателю")
                        .font(.fontTitle4)
                        .foregroundColor(.basicWhite)
                    Text("Он получит его с откликом на вакансию.")
                        .font(.fontTitle4)
                        .foregroundColor(.basicGrey3)
                    ForEach(1..<4) { question in
                        Text("question")
                    }
                    
                }
            }
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
        
    }
        
}

struct VacancieView_Previews: PreviewProvider {
    static var previews: some View {
        VacancieView()
            .environmentObject(GlavnayaViewModel())
    }
}
