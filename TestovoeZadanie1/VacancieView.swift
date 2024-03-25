//
//  VacancieView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct VacancieView: View {
    
    @EnvironmentObject var vm: GlavnayaViewModel
    
    var vacancie : Vacancie
    @State var newSchedules = [String]()
    
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
                Image(systemName: vm.favorites.contains(vacancie.id) ? "heart.fill" : "heart")
                    .foregroundColor(vm.favorites.contains(vacancie.id) ? Color.specialBlue : Color.basicWhite)
                    .font(.system(size:24))
                    .onTapGesture {
                        if vm.favorites.contains(vacancie.id) {
                            vm.favorites.removeAll{$0 == vacancie.id}
                            UserDefaults.standard.removeObject(forKey: vm.email)
                            UserDefaults.standard.set(vm.favorites, forKey: vm.email)
                        } else {
                            vm.favorites.append(vacancie.id)
                            UserDefaults.standard.removeObject(forKey: vm.email)
                            UserDefaults.standard.set(vm.favorites, forKey: vm.email)
                        }
                    }
            }
            .padding(.bottom, 16)
            Group {
                Text(vacancie.title)
                    .font(.fontTitle1)
                    .padding(.bottom, 12)
                Text(vacancie.salary.full)
                    .font(.fontText1)
                    .padding(.bottom, 16)
                Group {
                    Text("Требуемый опыт: ") + Text(vacancie.experience.text)
                }
                    .font(.fontText1)
                .padding(.bottom, -4)
                Text(newSchedules.joined(separator: ", "))
                    .font(.fontText1)
                    .padding(.bottom, 16)
            }
            .foregroundColor(.basicWhite)
            GeometryReader { geo in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    
                    HStack {
                        if (vacancie.appliedNumber ?? 0) > 0 {
                            HStack(alignment: .top) {
                                Text(String(vacancie.appliedNumber ?? 0)) + Text(" человек уже откликнулись")
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
                            .frame(maxWidth: geo.size.width*0.5)
                            .background(Color.specialDarkGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        Spacer()
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
                        .frame(maxWidth: geo.size.width*0.5)
                        .padding([.leading, .trailing], 16)
                        .background(Color.specialDarkGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                    }
                    
                    .padding(.bottom, 16)
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text(vacancie.company)
                                .foregroundColor(.basicWhite)
                                .font(.fontTitle3)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.basicGrey3)
                        }
                        Image("CompanyMap")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .scaledToFill()
                        
                        Text("\(vacancie.address.town), \(vacancie.address.street), \(vacancie.address.house)")
                            .foregroundColor(.basicWhite)
                            .font(.fontText1)
                    }
                    .padding([.top, .bottom], 12)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 16)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.bottom, 16)
                    Text(vacancie.description ?? "")
                        .foregroundColor(.basicWhite)
                        .padding(.bottom, 24)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Ваши задачи")
                        .font(.fontTitle2)
                        .padding(.bottom, 12)
                        .foregroundColor(.basicWhite)
                    Text(vacancie.responsibilities)
                        .foregroundColor(.basicWhite)
                        .font(.fontText1)
                        .padding(.bottom, 16)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Задайте вопрос работодателю")
                        .font(.fontTitle4)
                        .foregroundColor(.basicWhite)
                    Text("Он получит его с откликом на вакансию.")
                        .font(.fontTitle4)
                        .foregroundColor(.basicGrey3)
                        .padding(.bottom, 16)
                    ForEach(vacancie.questions, id: \.self) { question in
                        Text(question)
                            .foregroundColor(.basicWhite)
                            .font(.fontTitle4)
                            .padding([.top, .bottom], 8)
                            .padding([.leading, .trailing], 16)
                            .background(Color.basicGrey1)
                            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                    }
                    
                    Button("Откликнуться") {
                        
                    }
                    .buttonStyle(fakeBigGreenButton(isDisabled: false))
                    .padding(.top, 16)
                }
            }
            }
        }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .onAppear {
                    recapitilize(array: vacancie.schedules)
                }
        
    }
    
    func recapitilize(array: [String]) {
        newSchedules = [String]()
        for string in array {
            let newString = string.prefix(1).capitalized + string.dropFirst()
            newSchedules.append(newString)
        }
    }
        
}

//struct VacancieView_Previews: PreviewProvider {
  //        
//    static var previews: some View {
//        VacancieView(vacancie: vacancie)
//            .environmentObject(GlavnayaViewModel())
//    }
//}
