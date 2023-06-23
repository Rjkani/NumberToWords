//
//  CalculatorViewModel.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import Foundation
import Combine
extension CalculatorView{
    
    final class ViewModel: ObservableObject{
        
        @Published private var calculator = Calculator()
       
        var displayText: String{
            return calculator.displayText
        }
        
        var resultTextFormat1: String{
            return calculator.resultTextFormat1
        }
        
        
        
        var buttonTypes: [[ButtonType]]{
            [
                
                [.digit(.one), .digit(.two),.digit(.three) , .digit(.four)],
                [.digit(.five), .digit(.six), .digit(.seven), .digit(.eight)],
                [.digit(.nine), .digit(.zero), .copy, .allClear]
                
            
            ]
        }
        
        func performAction(for buttonType: ButtonType){
            switch buttonType{
            case .digit(let digit):
                calculator.setDigit( digit)
            case .point:
                calculator.setDecimal()
            case .comma:
                calculator.setComma()
            case .result:
                calculator.evaluate()
            case .copy:
                calculator.copy()
            
            case .allClear:
                calculator.allClear()
                
            }
        }
    }
}
