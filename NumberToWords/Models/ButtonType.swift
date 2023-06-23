//
//  ButtonType.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible
{
    case digit(_ digit: Digit)
    case point
    case comma
    case result
    case allClear
    case copy
    
    var description: String{
        switch self{
        case .digit(let digit):
            return digit.description
        case .point:
            return "."
        case .comma:
            return ","
        case .result:
            return "="
        
        case .allClear:
            return ""
        case .copy:
            return ""
        }
        
    }
    var systemImage: String{
        switch self{
        case .allClear:
                return "xmark"
        case .copy:
                return "doc.on.doc"
        default:
                return ""
        }
    }
    
    var backgroundColor: Color{
        switch self{
        case .result:
            return .green
        case .copy:
            return .clear
        case .allClear:
            return .orange
        
        default:
        return .secondary
        
    }
    
    }
    
    var foregroundColor: Color{
        switch self{
        case .allClear, .result:
            return .white
        case .copy:
            return .secondary
            
        default:
            return .white
        }
    }
    
}
