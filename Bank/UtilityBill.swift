//
//  UtilityBill.swift
//  Bank
//
//  Created by Dimitar Dinev on 13.04.21.
//

struct UtilityBill {
    static func createItems() -> [Item] {
        return [Item(name: "GAS Княжево", image: "Mask Group 80.jpg", value: 18.32, date: "2 ОКТ, 2020"),
                Item(name: "ЧЕЗ София", image: "Image 37.jpg", value: 123.40, date: "30 СЕП, 2020"),
                Item(name: "EVN", image: "Image 38.jpg", value: 58.70, date: "16 СЕП, 2020"),
                Item(name: "Вода", image: "Image 39.jpg", value: 32.50, date: "15 СЕП, 2020")]
    }
}
