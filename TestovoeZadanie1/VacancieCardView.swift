//
//  VacanciePreview.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct VacancieCardView: View {
    
    var vacancie : Vacancie
    
    @EnvironmentObject var vm : GlavnayaViewModel
    @EnvironmentObject var vmVhod : VhodViewModel
    
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Group {
                        if vacancie.lookingNumber != nil {
                            (2...4).contains(vacancie.lookingNumber!) ? Text("Сейчас просматривает \(vacancie.lookingNumber!) человека") : Text("Сейчас просматривает \(vacancie.lookingNumber!) человек")
                        }
                    }
                    .foregroundColor(.specialGreen)
                    .font(.fontText1)
                    Spacer()
                    Image(systemName: vm.favorites.contains(vacancie.id) ? "heart.fill" : "heart")
                        .foregroundColor(vm.favorites.contains(vacancie.id) ? Color.specialBlue : Color.basicGrey3)
                        .font(.system(size:24))
                        .onTapGesture {
                            if vm.favorites.contains(vacancie.id) {
                                vm.favorites.removeAll{$0 == vacancie.id}
                                UserDefaults.standard.removeObject(forKey: vmVhod.email)
                                UserDefaults.standard.set(vm.favorites, forKey: vmVhod.email)
                            } else {
                                vm.favorites.append(vacancie.id)
                                UserDefaults.standard.removeObject(forKey: vmVhod.email)
                                UserDefaults.standard.set(vm.favorites, forKey: vmVhod.email)
                            }
                        }
                }
                Text(vacancie.title)
                    .foregroundColor(.basicWhite)
                    .font(.fontTitle3)
                Group{ Text(vacancie.address.town)
                }
                .foregroundColor(.basicWhite)
                .font(.fontText1)
                .padding(.bottom, -10)
                HStack(alignment: .bottom) {
                    Text(vacancie.company)
                        .foregroundColor(.basicWhite)
                        .font(.fontText1)
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.basicGrey3)
                }
                HStack {
                    Image(systemName: "bag")
                        .foregroundColor(.basicWhite)
                    Text(vacancie.experience.previewText)
                        .foregroundColor(.basicWhite)
                        .font(.fontText1)
                }
                Group {
                    Text("Опубликовано ") + Text(vm.dateTransformatting(date: vacancie.publishedDate))
                }
                .foregroundColor(.basicGrey3)
                .font(.fontText1)
                .padding([.bottom, .top], 10)
                Button ("Откликнуться") {
                }
                .buttonStyle(BigGreenButton(isDisabled: false))
            }
        }
        .padding([.top, .bottom], 24)
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 16)
        .background(Color.basicGrey1)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
    
}


struct VacancieCardView_Previews: PreviewProvider {
    
    static var vacancies : [Vacancie] = Bundle.main.decode("SimpleData")
    static var vacancie = vacancies[0]

    static var previews: some View {
        VacancieCardView(vacancie: vacancie)
            .environmentObject(GlavnayaViewModel())
            .environmentObject(VhodViewModel())
    }
}
