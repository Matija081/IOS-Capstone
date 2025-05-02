//
//  Fonts.swift
//  LLApp
//
//  Created by Matija Radinovic on 1.5.25..
//

import Foundation
import SwiftUI

extension Font {
    static let displayTitle = Font.custom("Markazi Text", size: 42).weight(.regular)
    static let displaySubTitle = Font.custom("Markazi Text", size: 26)
    
    static let leadText: Font = Font.custom("Karla", size: 18).weight(.medium)
//    static let regularText: Font = Font.custom("Markazi Text", size: 18)
    static let sectionTitle: Font = Font.custom("Karla", size: 18).weight(.black)
    static let sectionSubtitle: Font = Font.custom("Karla", size: 16).weight(.heavy)
    static let cardTitle: Font = Font.custom("Karla", size: 14).weight(.bold)
    static let cardText: Font = Font.custom("Karla", size: 13)
    static let highlightText: Font = Font.custom("Karla", size: 14).weight(.medium)
}
