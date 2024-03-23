//
//  Favourites.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import SwiftUI

struct Favourites: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Избранное")
                .foregroundColor(.basicWhite)
                .font(.fontTitle2)
                .padding(.bottom, 16)
            Text("1 вакансия")
                .foregroundColor(.basicGrey3)
                .font(.fontText1)
                .padding(.bottom, 8)
            
            ForEach(1..<4) { vacancie in
             //   VacanciePreviewView(title: "ui/ux")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct Favourites_Previews: PreviewProvider {
    
    static var previews: some View {
        Favourites()
    }
}
