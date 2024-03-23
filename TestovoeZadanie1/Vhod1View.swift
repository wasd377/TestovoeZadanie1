//
//  AuthorizationView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import SwiftUI

struct Vhod1View: View {
    
    @EnvironmentObject var vmVhod : VhodViewModel

    @State var textField = ""
    @State var textFieldCheckResult = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                Text("Вход в личный кабинет")
                    .foregroundColor(.basicWhite)
                    .font(.fontTitle2)
                    Spacer()
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Поиск работы")
                            .font(.fontTitle3)
                            .foregroundColor(.basicWhite)
                            .multilineTextAlignment(.leading)

                        HStack{
                            Image("Envelope")
                                .foregroundColor(.basicGrey4)
                                .padding(.leading)
                            TextField("Электронная почта или телефон", text: $textField, prompt: Text("Электронная почта или телефон").foregroundColor(.basicGrey4))
                                .textFieldStyle(.plain)
                                .foregroundColor(.basicWhite)
                                .padding(10)
                                .font(.fontText1)
                                .textFieldStyle(.roundedBorder)
                                .autocapitalization(.none)
                            if !textField.isEmpty {
                                       Button {
                                           textField = ""
                                       }label: {
                                           Image(systemName: "multiply")
                                               .foregroundColor(.basicGrey4)
                                       }
                                       .padding(.trailing, 10)
                                   }
                        }
                        .onChange(of: textField, perform: {value in
                            textFieldCheckResult = ""
                        })
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(textFieldCheckResult.isEmpty ? .black : .specialRed, lineWidth: 1)
                               
                        )
                        .padding([.top, .bottom], 16)
                        if !textFieldCheckResult.isEmpty {
                            Text(textFieldCheckResult)
                                .foregroundColor(.specialRed)
                                .padding(.bottom, 16)
                        }
                        
                        HStack {
                            Button("Продолжить"){
                                
                                if textField.isValidEmail {
                                    vmVhod.email = textField
                                    //переход на следующий экран
                                } else {
                                    textFieldCheckResult = "Вы ввели неверный e-mail."
                                }
                            }
                            .buttonStyle(BigBlueButton(isDisabled: textField.isEmpty ? true : false ))
                            
                            Button("Войти с паролем") {
                                
                            }
                        }
                        
                    }
                    .padding([.top, .bottom], 24)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 16)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
             
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Поиск сотрудников")
                            .font(.fontTitle3)
                            .foregroundColor(.basicWhite)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        Text("Размещение вакансий и доступ к базе резюме")
                            .foregroundColor(.basicWhite)
                            .font(.fontButtonText2)
                            .padding(.bottom, 16)
                        Button("Я ищу сотрудников") {
                            
                        }
                        
                        .buttonStyle(BigGreenButton(isDisabled: false))
                    }
                    .padding([.top, .bottom], 24)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 16)
                    .background(Color.basicGrey1)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                Spacer()
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        
    }
}





struct Vhod1View_Previews: PreviewProvider {
    static var previews: some View {
        Vhod1View()
            .environmentObject(VhodViewModel())
    }
}
