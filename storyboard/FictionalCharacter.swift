//
//  Characters.swift
//  otus_homework_10
//
//  Created by Поляков Станислав Денисович on 12.05.2024.
//

import Foundation

public struct FictionalCharacter {
    let image: String
    let firstName: String
    let lastName: String
    let jobTitle: String
    let address: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

public let characters: [FictionalCharacter] = [
    FictionalCharacter(
        image: "bear",
        firstName: "Винни",
        lastName: "Пух",
        jobTitle: "android dev",
        address: "Cotchford Ln, Hartfield TN7 4HA, England"
    ),
    FictionalCharacter(
        image: "cat",
        firstName: "Василий",
        lastName: "Мурзилкин",
        jobTitle: "iOS dev",
        address: "Рязанская область, д. Простоквашино, Российская Федерация"
    ),
    FictionalCharacter(
        image: "croc",
        firstName: "Геннадий",
        lastName: "Зеленый",
        jobTitle: "team lead",
        address: "Зоопарк в одном очень большом городе"
    ),
    FictionalCharacter(
        image: "dog",
        firstName: "Полиграф",
        lastName: "Шариков",
        jobTitle: "analyst",
        address: "г. Москва, ул. Пречистенка, 24"
    ),
    FictionalCharacter(
        image: "monkey",
        firstName: "Сунь",
        lastName: "Укун",
        jobTitle: "product owner",
        address: "Под водопадом на благодатной Горе Цветов и Плодов"
    ),
    FictionalCharacter(
        image: "rhino",
        firstName: "Алексей",
        lastName: "Сицевич",
        jobTitle: "qa",
        address: "г. Иркутск, Российская Федерация"
    ),
    FictionalCharacter(
        image: "wolf",
        firstName: "Сергей",
        lastName: "Тамбовский",
        jobTitle: "designer",
        address: "Лес в окрестностях города Тамбов"
    )
]
