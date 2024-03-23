//
//  GlavnayaViewModel.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import Foundation

class GlavnayaViewModel: ObservableObject {
    
    @Published var vacancies = [Vacancie]()
    @Published var favorites = [String]()
    
    func loadLocalData(email: String) {
        // find file with data
        if let url = Bundle.main.url(forResource: "TestData", withExtension: nil) {
            // load file into string
            if let jsonData = try? Data(contentsOf: url) {
                
                let json = try? JSONDecoder().decode(JSONContainer.self, from: jsonData)
                
                vacancies = json?.vacancies ?? []
          
            }
        }
        
        favorites = UserDefaults.standard.object(forKey: email) as? [String] ?? [String]()

        for vacancie in vacancies {
            if vacancie.isFavorite == true && !favorites.contains(vacancie.id) {
                favorites.append(vacancie.id)
            }
        }
        
        UserDefaults.standard.removeObject(forKey: email)
        UserDefaults.standard.set(favorites, forKey: email)
        
        }
    
    // Склоняем названия месяцов как надо
    func dateTransformatting(date: String) -> String {
        
        let monthsNames : [String] = ["нулевой месяц", "января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
        
        let dateString = date // "2024-02-20"  "Thu, 22 Oct 2015 07:45:17 +0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd" //EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "ru_RU")
        
        let dateObj = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "d-M"
        let day = ("\(Calendar.current.dateComponents([.day], from: dateObj!).day!)")
        let month = monthsNames[(Calendar.current.dateComponents([.month], from: dateObj!).month!)]
        let newDate = "\(day) \(month)"
       
            return newDate
        }
    
    // Делаем первые буквы заглавными в графике работы
}

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}



    


    

