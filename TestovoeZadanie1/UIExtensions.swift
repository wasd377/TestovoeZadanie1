//
//  UIExtensions.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 21.03.2024.
//

import Foundation
import SwiftUI

// В этом файле будут храниться все необходимые расширения для создания интерфейса:
// - цвета
// - шрифты
// - проверка емейла на валидность
// - квадратики для ввода пинкода

// Создаем все цвета, используемые в проекте
extension Color {
    
    init(hex: Int, opacity: Double = 1.0) {
           let red = Double((hex & 0xff0000) >> 16) / 255.0
           let green = Double((hex & 0xff00) >> 8) / 255.0
           let blue = Double((hex & 0xff) >> 0) / 255.0
           self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
       }
    
    public static let basicBlack = Color(hex:0x000000)
    public static let basicGrey1 = Color(hex:0x222325)
    public static let basicGrey2 = Color(hex:0x313234)
    public static let basicGrey3 = Color(hex:0x858688)
    public static let basicGrey4 = Color(hex:0x9F9F9F)
    public static let basicGrey5 = Color(hex:0xDBDBDB)
    public static let basicWhite = Color(hex:0xFFFFFF)

    public static let specialBlue = Color(hex: 0x2B7EFE)
    public static let specialDarkBlue = Color(hex:0x00427D)
    public static let specialGreen = Color(hex:0x4CB24E)
    public static let specialDarkGreen = Color(hex:0x015905)
    public static let specialRed = Color(hex:0xFF0000)
    
    public static let shadow  = Color(hex:0x222235)
}

// Создаем все шрифты, используемые в проекте
extension Font {
    public static let fontTitle1 = Font(UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.semibold))
    public static let fontTitle2 = Font(UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold))
    public static let fontTitle3 = Font(UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium))
    public static let fontTitle4 = Font(UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    
    public static let fontText1 = Font(UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular))
    
    public static let fontButtonText1 = Font(UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold))
    public static let fontButtonText2 = Font(UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular))
    
    public static let fontTabText = Font(UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular))
    
    public static let fontNumber = Font(UIFont.systemFont(ofSize: 7, weight: UIFont.Weight.regular))
 
}

// Создаем все кнопки, используемые в проекте
struct BigBlueButton: ButtonStyle {
    var isDisabled: Bool
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
         configuration.label
            .font(.fontButtonText1)
            .frame(maxWidth: .infinity)
             .padding(20)
             .background(isDisabled ? Color.specialDarkBlue : Color.specialBlue)
             .foregroundStyle(isDisabled ? Color.basicGrey4 : Color.basicWhite)
             .clipShape(RoundedRectangle(cornerRadius: 8))
     }
}

struct BigGreenButton: ButtonStyle {
    var isDisabled: Bool

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
         configuration.label
            .frame(maxWidth: .infinity)
            .padding(10)
             .background(isDisabled ? Color.specialDarkGreen : Color.specialGreen)
             .foregroundStyle(isDisabled ? Color.basicGrey4 : Color.basicWhite)
             .clipShape(RoundedRectangle(cornerRadius: 50))
             .padding([.leading,.trailing], 10)
     }
}

struct fakeBigGreenButton: ButtonStyle {
    var isDisabled: Bool

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
         configuration.label
            .frame(maxWidth: .infinity)
            .padding(20)
             .background(isDisabled ? Color.specialDarkGreen : Color.specialGreen)
             .foregroundStyle(isDisabled ? Color.basicGrey4 : Color.basicWhite)
             .clipShape(RoundedRectangle(cornerRadius: 8))
     }
}

// Проверяем емейл на соответствие маске
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

// Внешний вид квадратиков пинкодов
struct PinCode: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.basicWhite)
            .multilineTextAlignment(.center)
            .padding([.top, .bottom], 10)
            .preferredColorScheme(.light)
            .frame(width: 48, height: 48)
            .fixedSize(horizontal: true, vertical: true)
            .background(Color.basicGrey2)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .padding(.bottom, 16)
    }
}
