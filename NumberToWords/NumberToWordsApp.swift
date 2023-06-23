//
//  iCalculatorApp.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import SwiftUI

@main
struct NumberToWordsApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
