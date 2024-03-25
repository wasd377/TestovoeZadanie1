//
//  Model.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 20.03.2024.
//

import Foundation
import SwiftUI

struct User: Codable {
    var email: String
}

struct Vacancie: Identifiable, Codable {
    var id: String
    var lookingNumber: Int?
    var title: String
    var address: Address
    
    struct Address: Codable {
        var town: String
        var street: String
        var house: String
    }
    
    var company: String
    var experience: Experience
    
    struct Experience: Codable {
        var previewText: String
        var text: String
    }

    var publishedDate: String
    var isFavorite: Bool
    
    var salary: Salary
    
    struct Salary: Codable {
        var short: String?
        var full: String
    }

    var schedules: [String]
    
    var appliedNumber: Int?
    var description: String?
    var responsibilities: String
    var questions: [String]
    
}

struct Vacancies: Codable {
    let vacancies: [Vacancie]
}

class Router: ObservableObject {
    // Contains the possible destinations in our Router
    enum Route:  Hashable {
        case vhod1
        case vhod2
        case glavnaya
       // case vacancie(Vacancie)
        case favorites
        case zaglushka
    }
    
    // Used to programatically control our navigation stack
    @Published var path: NavigationPath = NavigationPath()
    
    // Builds the views
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .vhod1:
            Vhod1View()
        case .vhod2:
            Vhod2View()
        case .glavnaya:
           GlavnayaView()
//        case .vacancie(var vacancie):
//            VacancieView(vacancie: vacancie)
        case .favorites:
            FavoritesView()
        case .zaglushka:
            ZaglushkaView()
        }
    }
    
    // Used by views to navigate to another view
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    // Used to go back to the previous screen
    func navigateBack() {
        path.removeLast()
    }
    
    // Pop to the root screen in our hierarchy
    func popToRoot() {
        path.removeLast(path.count)
    }
}







