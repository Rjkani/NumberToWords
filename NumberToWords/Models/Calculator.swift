//
//  Calculator.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import Foundation
import UIKit

public struct Calculator{
    
    private var newNumber: Int? = nil
    
   
//    private var number: Int?{
//        newNumber
//    }
    var resultTextFormat1: String{
        let languageString = UserDefaults.standard.string(forKey: "Language") ?? "International|en_US"
        //guard let languageString = languageString else { return ""}
        let language = languageString.components(separatedBy: "|").last?.trimmingCharacters(in: .whitespaces)
        switch language{
        case "Tamil":
            return convertNumberToTamilWords(newNumber)
        case "IndianEnglish":
            return convertNumberToWords(newNumber).lowercased()
        default:
            return convertNumberToWordsInternationalFormat(newNumber, languagePreference: language!)
        
        }
      

    }
    
    var displayText: String{
        return getNumberString(forNumber: newNumber, withCommas: true)
    }
    
    mutating func setDigit(_ digit: Digit){
        guard canAddDigit(digit) else { return }
                let numberString = getNumberString(forNumber: newNumber)
                if let number = Int("\(numberString)\(digit.rawValue)") {
                    newNumber = number
                }
    }
    mutating func setDecimal(){
        
    }
    mutating func setComma(){
        
    }
    mutating func evaluate(){
        
    }
    mutating func copy(){
        UIPasteboard.general.string = resultTextFormat1
    }
   
    mutating func allClear(){
        newNumber = nil
    }
    
    private func getNumberString(forNumber number: Int?, withCommas: Bool = false) -> String {
        guard let number = number else { return "0" }
                return withCommas ? number.formatted(.number) : String(number)
      }

      private func canAddDigit(_ digit: Digit) -> Bool {
          return newNumber != nil || digit != .zero
      }
    private func convertNumberToWordsInternationalFormat(_ numberToConvert: Int? , languagePreference: String) -> String {
        guard let numberToConvert = numberToConvert else{return "Enter Number"}
        let number = numberToConvert
        let language = languagePreference.isEmpty ? "en_US": languagePreference
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: language)
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }



    private func convertNumberToWords(_ numberToConvert: Int?) -> String {
        guard let numberToConvert = numberToConvert else{return "Enter Number"}
        
        if numberToConvert == 0 {
            return "ZERO"
        }
        var number = numberToConvert
        var words = ""
        
        if number < 0 {
            words += "minus " + convertNumberToWords(abs(number))
        } else {
            if number / 10000000 > 0 {
                words += convertNumberToWords(number / 10000000) + " CRORE "
                number %= 10000000
            }
            
            
            if number / 100000 > 0 {
                words += convertNumberToWords(number / 100000) + " LAKH "
                number %= 100000
            }
            
            if number / 1000 > 0 {
                words += convertNumberToWords(number / 1000) + " THOUSAND "
                number %= 1000
            }
            
            if number / 100 > 0 {
                words += convertNumberToWords(number / 100) + " HUNDRED "
                number %= 100
            }
            
            if number > 0 {
                if words != "" {
                    words += "AND "
                }
                
                let unitsMap = [
                    "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN",
                    "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN"
                ]
                
                let tensMap = [
                    "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY"
                ]
                
                if number < 20 {
                    words += unitsMap[number]
                } else {
                    words += tensMap[number / 10]
                    if (number % 10) > 0 {
                        words += " " + unitsMap[number % 10]
                    }
                }
            }
        }
        
        return words
    }

    private func convertNumberToTamilWords(_ numberToConvert: Int?) -> String {
        guard let numberToConvert = numberToConvert else{return "Enter Number"}
        var number = numberToConvert
        let unitsMap = [
            0: "பூஜ்யம்",
            1: "ஒன்று",
            2: "இரண்டு",
            3: "மூன்று",
            4: "நான்கு",
            5: "ஐந்து",
            6: "ஆறு",
            7: "ஏழு",
            8: "எட்டு",
            9: "ஒன்பது",
            10: "பத்து",
            11: "பதினொன்று",
            12: "பன்னிரண்டு",
            // Add more as needed
        ]
        
        let numberInWords = [
            1_00_00_000: "கோடி",
            1_00_000: "லட்சம்",
            1_000: "ஆயிர",
            100: "நூறு",
            10: "பத்து"
        ]
        
        var result = ""
        
        if number == 0 {
            return unitsMap[0]!
        }
        
        for (value, word) in numberInWords.sorted(by: { $0.key > $1.key }) {
            if number >= value {
                let quotient = number / value
                result += convertNumberToTamilWords(quotient) + " " + word + " "
                number %= value
            }
        }
        
        if let unitWord = unitsMap[number] {
            result += unitWord
        }
        
        return result
    }
}
