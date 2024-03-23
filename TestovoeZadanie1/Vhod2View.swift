//
//  Vhod2.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 21.03.2024.
//

import SwiftUI

struct Vhod2View: View {
    
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
                
            HStack {
                TextField(" ", text: $codeField1, prompt: focusedField == .codeField1 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField1)
                    .modifier(PinCode())
                TextField(" ", text: $codeField2, prompt: focusedField == .codeField2 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField2)
                    .modifier(PinCode())
                TextField(" ", text: $codeField3, prompt: focusedField == .codeField3 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField3)
                    .modifier(PinCode())
                TextField(" ", text: $codeField4, prompt: focusedField == .codeField4 ? Text("Yes") : Text("*").foregroundColor(.basicGrey4).font(Font(UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.semibold))))
                    .focused($focusedField, equals: .codeField4)
                    .modifier(PinCode())
            }
            .onChange(of: codeField1) { value in
                if !codeField1.isEmpty {
                    focusedField = .codeField2
                }
            }
            .onChange(of: codeField2) { value in
                if !codeField2.isEmpty {
                    focusedField = .codeField3
                }
            }
            .onChange(of: codeField3) { value in
                if !codeField3.isEmpty {
                    focusedField = .codeField4
                }
            }
            
            
            Button("Подтвердить") {
                
             // Здесь будет код перехода на другой экран
               
            }
            .buttonStyle(BigBlueButton(isDisabled: !codeField1.isEmpty && !codeField2.isEmpty && !codeField3.isEmpty && !codeField4.isEmpty))
        }
        .onAppear {
            focusedField = .codeField1
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
    }
}

struct Vhod2View_Previews: PreviewProvider {
    
    static var previews: some View {
    
        Vhod2View()
            .environmentObject(VhodViewModel())
    }
}
