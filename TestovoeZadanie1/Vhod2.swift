//
//  Vhod2.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 21.03.2024.
//

import SwiftUI

struct Vhod2: View {
    
    @EnvironmentObject var vm : VhodViewModel
    
    @State var codeField1 = ""
    @State var codeField2 = ""
    @State var codeField3 = ""
    @State var codeField4 = ""
    @FocusState private var focusedField : FocusedField?
    
    enum FocusedField {
           case codeField1, codeField2, codeField3, codeField4
       }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Отправили код на \(vm.email)")
                .foregroundColor(.basicWhite)
                .font(.fontTitle2)
                .padding(.bottom, 16)
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет.")
                .foregroundColor(.basicWhite)
                .font(.fontTitle3)
                .padding(.bottom, 16)
            if focusedField == .codeField1 {
                Text("1")
                    .foregroundColor(.basicWhite)
            }
            else {
                Text("lol")
                    .foregroundColor(.basicWhite)
            }
                
            TextField(" ", text: $codeField1, prompt: focusedField == .codeField1 ? Text("Yes") : Text("N").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                      
                      //Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))) : Text("")).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold)))
                .focused($focusedField, equals: .codeField1)
                .foregroundColor(.basicWhite)
                .multilineTextAlignment(.center)
                .padding([.top, .bottom], 10)
                .preferredColorScheme(.light)
                .frame(width: 48, height: 48)
                .fixedSize(horizontal: true, vertical: true)
                .background(Color.basicGrey2)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.bottom, 16)
            Button("Подтвердить") {
                
                focusedField = .codeField1
                  
               
            }
            .buttonStyle(BigBlueButton(isDisabled: false))
        }
        .onAppear {
            focusedField = .codeField1
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
    }
}

struct Vhod2_Previews: PreviewProvider {
    static var previews: some View {
        Vhod2()
            .environmentObject(VhodViewModel())
    }
}
