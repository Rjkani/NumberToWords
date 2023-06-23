//
//  SettingsView.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 22/06/23.
//

import Foundation
import SwiftUI

struct Language {
    let name: String
    let identifier: String
}

struct SettingsView: View{
    
    @Binding var selectedSettings: String
    @Environment(\.presentationMode) var presentationMode
    var languages = [
        Language(name: "Arabic", identifier: "ar"),
        Language(name: "Chinese", identifier: "zh_CN"),
        Language(name: "English - Indian", identifier: "IndianEnglish"),
        Language(name: "English - International", identifier: "en_US"),
        Language(name: "French", identifier: "fr"),
        Language(name: "German", identifier: "de"),
        Language(name: "Hindi", identifier: "hi"),
        Language(name: "Italian", identifier: "it"),
        Language(name: "Japanese", identifier: "ja"),
        Language(name: "Portuguese", identifier: "pt_PT"),
        Language(name: "Russian", identifier: "ru"),
        Language(name: "Spanish", identifier: "es_ES"),
        Language(name: "Tamil", identifier: "ta")
        ]
   
    var body: some View{
        VStack{
           
            HStack{
                Button{
                    cancelSettings()
                }label: {
                    Image(systemName: "xmark").imageScale(.medium)
                }.buttonStyle(CustomButtonStyle(
                    size: 80,
                    backgroundColor: (Color.white),
                    foregroundColor: (Color.black)
                ))
                Text("Settings View")
                    .font(.largeTitle)
                Spacer()
            }.padding(Constants.padding)
            
            
            HStack{
                VStack{
                    Text("Choose Language").font(.title2)
                    List(languages, id: \.identifier) { language in
                        Text(language.name)
                            .onTapGesture {
                                selectedSettings = language.name
                                UserDefaults.standard.set( "\(language.name)|\(language.identifier)", forKey: "Language")
                            }
                    }
                }
                
            }
            
            Spacer()
        }
        
    }
    
    private func cancelSettings(){
        presentationMode.wrappedValue.dismiss()
    }
    
}



struct SettingsView_Previews: PreviewProvider{
    static var previews: some View{
        SettingsView(selectedSettings: .constant(""))
    }
}
