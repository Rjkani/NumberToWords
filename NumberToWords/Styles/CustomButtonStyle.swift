//
//  ButtonStyle.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle{
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: size, height: size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay{
                if configuration.isPressed{
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}

struct CustomButtonStyle_Previews: PreviewProvider{
    static let buttonType: ButtonType = .digit(.four)
    static var previews: some View{
        Button(buttonType.description){}
            .buttonStyle(CustomButtonStyle(
                size: 75,
                backgroundColor: buttonType.backgroundColor,
                foregroundColor:buttonType.foregroundColor
            )
        )
        
    }
}
