//
//  VacanciePreview.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct VacanciePreviewView: View {
    
    var vacancie : Vacancie
    var user : User
    
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
                    Image(systemName: vacancie.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(vacancie.isFavorite ? Color.specialBlue : Color.basicGrey3)
                        .font(.system(size:24))
                        .onTapGesture {
                            
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
                // print("day: \(date.get(.day)), month: \(date.get(.month)), year: \(date.get(.year))")
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


struct VacanciePreviewView_Previews: PreviewProvider {
    
    static var vacancies : [Vacancie] = Bundle.main.decode("VerySimpleData")
    static var vacancie = vacancies[0]
    static var user = User(email: "wasd")

    static var previews: some View {
        VacanciePreviewView(vacancie: vacancie, user: user)
            .environmentObject(GlavnayaViewModel())
            .environmentObject(VhodViewModel())
    }
}
