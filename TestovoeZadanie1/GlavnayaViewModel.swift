//
//  GlavnayaViewModel.swift
//  TestovoeZadanie1
//
//  Created by Natalia D on 22.03.2024.
//

import Foundation

class GlavnayaViewModel: ObservableObject {
    
    @Published var vacancies = [Vacancie]()
    
    func loadLocalData() {
        // find file with data
        if let url = Bundle.main.url(forResource: "VerySimpleData", withExtension: nil) {
            // load file into string
            if let jsonData = try? Data(contentsOf: url) {
                
                let json = try? JSONDecoder().decode([Vacancie].self, from: jsonData)
                
                vacancies = json ?? []
                
            }
        }
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
    
    // Добавляем вакансию в избранное
    func addFavorite(favorite: String, email: String) {
        
        var savedFavorites = UserDefaults.standard.array(forKey: email) as? [String]
        savedFavorites?.append(favorite)
        UserDefaults.standard.set(savedFavorites, forKey: email)
    }
    
    // Проверяем, что вакансия в избранном
    func checkFavorite(favorite: String, email: String) -> Bool {
        
        let savedFavorites = UserDefaults.standard.array(forKey: email) as? [String]
        if ((savedFavorites?.contains(favorite)) != nil) {
            return true
        } else {
            return false
        }
    }
    
    // Удаляем вакансию из избранного
    func removeFavorite(favorite: String, email: String) {
        
        var savedFavorites = UserDefaults.standard.array(forKey: email) as? [String]
        savedFavorites = savedFavorites?.filter{$0 != favorite}
        UserDefaults.standard.set(savedFavorites, forKey: email)
    }
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



    


    

