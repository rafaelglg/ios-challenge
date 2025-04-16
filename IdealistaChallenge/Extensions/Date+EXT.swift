//
//  Date+EXT.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "d MMMM yyyy, HH:mm:ss"
        return formatter.string(from: self)
    }
}
