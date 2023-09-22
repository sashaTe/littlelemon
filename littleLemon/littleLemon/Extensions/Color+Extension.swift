//
//  Color+Extension.swift
//  littleLemon
//
//  Created by Alexander Zarutskiy on 21.09.2023.
//

import SwiftUI


extension Color {
    static let theme = ColorTheme()
}


struct ColorTheme {
    let accent = Color("AccentColor")
    let yellow = Color("Yellow")
    let white  = Color("White")
    let gray   = Color("Gray")
    let special = Color("Special")
}
