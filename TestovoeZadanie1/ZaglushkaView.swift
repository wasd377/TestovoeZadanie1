//
//  ZaglushkaView.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 24.03.2024.
//

import SwiftUI

struct ZaglushkaView: View {
    var body: some View {
        VStack {
            Text("Здесь могла быть ваша реклама.")
                .foregroundColor(.basicWhite)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ZaglushkaView_Previews: PreviewProvider {
    static var previews: some View {
        ZaglushkaView()
    }
}
