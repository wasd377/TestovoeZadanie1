//
//  Vhod2.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 21.03.2024.
//

import SwiftUI

struct Vhod2View: View {
    
    @EnvironmentObject var vm : GlavnayaViewModel
    @EnvironmentObject var router: Router
    
    @State var code = ["", "", "", ""]
    @FocusState private var focusedField : FocusedField?
    
    enum FocusedField {
           case codeField0, codeField1, codeField2, codeField3
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
                
            HStack {
                TextField(" ", text: $code[0], prompt: focusedField == .codeField0 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField0)
                    .modifier(PinCode())
                TextField(" ", text: $code[1], prompt: focusedField == .codeField1 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField1)
                    .modifier(PinCode())
                TextField(" ", text: $code[2], prompt: focusedField == .codeField2 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField2)
                    .modifier(PinCode())
                TextField(" ", text: $code[3], prompt: focusedField == .codeField3 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField3)
                    .modifier(PinCode())
            }
            .onChange(of: code[0]) { value in
                if !code[0].isEmpty {
                    focusedField = .codeField1
                }
                self.code[0] = String(value.prefix(1))
            }
            .onChange(of: code[1]) { value in
                if !code[1].isEmpty {
                    focusedField = .codeField2
                }
                self.code[1] = String(value.prefix(1))
            }
            .onChange(of: code[2]) { value in
                if !code[2].isEmpty {
                    focusedField = .codeField3
                }
                self.code[2] = String(value.prefix(1))
            }
            .onChange(of: code[3]) { value in
                self.code[3] = String(value.prefix(1))
            }
            
            
            Button("Подтвердить") {
                
                router.navigateTo(.glavnaya)
               
            }
            .disabled(code.contains("") ? true : false)
            .buttonStyle(BigBlueButton(isDisabled: code.contains("") ? true : false))
        }
        .onAppear {
            focusedField = .codeField0
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
    }
}

struct Vhod2View_Previews: PreviewProvider {
    
    static var previews: some View {
    
        Vhod2View()
            .environmentObject(GlavnayaViewModel())
    }
}
