//
//  CalculatorButton.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import Foundation
import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        
        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: ViewModel
        
        var body: some View {
            if buttonType.description.isEmpty {
                Button {
                    viewModel.performAction(for: buttonType)
                }label: {
                    Image(systemName:buttonType.systemImage)
                }.buttonStyle(CustomButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: buttonType.backgroundColor,
                    foregroundColor: buttonType.foregroundColor)
                )
            }else{
                Button {
                    viewModel.performAction(for: buttonType)
                    
                }label: {
                    Label(buttonType.description, systemImage: buttonType.systemImage)
                }.buttonStyle(CustomButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: buttonType.backgroundColor,
                    foregroundColor: buttonType.foregroundColor)
                )
            }
           
                
        }
        
        private func getButtonSize() -> CGFloat {
            
            let screenWidth = getScreenWidth()//UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4
            let spacingCount = buttonCount
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        
        private func getScreenWidth() -> CGFloat{
           
            let screenBounds = UIScreen.main.bounds
                let w = screenBounds.width
                let h = screenBounds.height
                let d = sqrt(w * w + h * h)
            

            return d/3
        }
    }
}
