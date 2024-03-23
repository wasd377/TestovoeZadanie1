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

// Определяем JSONContainer, то есть описываем куда нужно идти парсеру и что забирать.
struct JSONContainer: Codable {
// Из JSON мы забираем только данные по вакансиям
    let vacancies: [Vacancie]
}








