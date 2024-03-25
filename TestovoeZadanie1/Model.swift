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

struct Vacancie: Identifiable, Codable, Hashable {
    static func == (lhs: Vacancie, rhs: Vacancie) -> Bool {
        let result = lhs.id == rhs.id ? true : false
        return result
    }
    
    var id: String
    var lookingNumber: Int?
    var title: String
    var address: Address
    
    struct Address: Codable, Hashable {
        var town: String
        var street: String
        var house: String
    }
    
    var company: String
    var experience: Experience
    
    struct Experience: Codable, Hashable {
        var previewText: String
        var text: String
    }

    var publishedDate: String
    var isFavorite: Bool
    
    var salary: Salary
    
    struct Salary: Codable, Hashable {
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
    enum Route: Hashable {
        case vhod1
        case vhod2
        case glavnaya
        case vacancie(Vacancie)
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
        case .vacancie(var vacancie):
            VacancieView(vacancie: vacancie)
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

struct TabBarItem: View {
let title: String
let imageName: String
let tag: Int
@Binding var selectedTab: Int?

var body: some View {
    
    Button {
        selectedTab = selectedTab == tag ? nil : tag
    } label: {
        VStack(spacing: 4) {
            Image(systemName: imageName)
            Text(title)
        }
        .foregroundColor(selectedTab == tag ? .blue : .gray)
    }
  }
}

struct DataLoader {
    func downloadData(url: URL) async -> Data? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            print(error)
        }
        return nil
    }
}





