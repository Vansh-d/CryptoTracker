//
//  Double.swift
//  SwiftUICrypto
//
//  Created by Vansh Dubey on 08/01/26.
//

import Foundation

extension Double {
    private func currencyFormatter(minfractionDigits: Int,maxfractionDigits: Int) -> NumberFormatter{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maxfractionDigits
        formatter.minimumFractionDigits = minfractionDigits
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.usesGroupingSeparator = true
        formatter.currencyCode = "INR"
        formatter.currencySymbol = "₹"
        return formatter
    }
    
    func formattedCurrency(minfractionDigits: Int = 2,maxfractionDigits: Int = 6) -> String {
        return currencyFormatter(minfractionDigits: minfractionDigits, maxfractionDigits: maxfractionDigits).string(from: NSNumber(value: self)) ?? "₹0.00"
    }
    
    func formattedString(fractiondigits: Int = 2) -> String{
        return String(format: "%.\(fractiondigits)f", self)
    }
    
    func formattedPercentageString() -> String{
        self.formattedString() + "%"
    }
}
