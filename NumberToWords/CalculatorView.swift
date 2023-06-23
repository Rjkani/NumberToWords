//
//  ContentView.swift
//  iCalculator
//
//  Created by Priyalakshmi Rajakani on 20/06/23.
//

import SwiftUI

struct CalculatorView: View {

    @EnvironmentObject private var viewModel: ViewModel
    @State public var showSettings = false
    @State private var selectedSettings = checkEmptyString(UserDefaults.standard.string(forKey: "Language"))
    

    var body: some View {
        VStack{
            Spacer()
            header
          
            resultTextFormat1
            displayText
            buttonPad
            
        }
        .padding(Constants.padding)
        .background(Color.black)
        .sheet(isPresented: $showSettings){
         SettingsView(selectedSettings: $selectedSettings)
        }
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
      //  let viewModel = viewModel()
        
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
    }
}
func checkEmptyString(_ valueString: String?) -> String {
guard let valueString = valueString else { return "International" }
   var language = valueString.components(separatedBy: "|").first?.trimmingCharacters(in: .whitespaces)
    if(language == nil){
        language = "International"
        UserDefaults.standard.set( "International|en_US", forKey: "Language")
    }
    return language ?? ""
}

extension CalculatorView {
  //
    private var header: some View{
        VStack{
            Button {
                showSettings = true
            }label: {
                Image(systemName:"slider.horizontal.3")
            }.buttonStyle(CustomButtonStyle(
                size: 80,
                backgroundColor: Color.black,
                foregroundColor: Color.white)
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(selectedSettings).foregroundColor(.white)
            Spacer()
            
        }
    }
    
    private var resultTextFormat1: some View{
        VStack{
            Text(viewModel.resultTextFormat1)
                .padding()
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 60, weight: .light))
                .lineLimit(7)
                .minimumScaleFactor(0.2)
        }
    }
    private var displayText: some View{
        VStack{
            Text(viewModel.displayText)
                .padding()
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 50, weight: .ultraLight))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
            
        }
    }
    private var buttonPad: some View{
        VStack{
            ForEach(viewModel.buttonTypes, id: \.self){row in
                HStack(spacing: Constants.padding){
                    
                    ForEach(row, id: \.self){buttonType in
                        CalculatorButton(buttonType: buttonType)
                        
                    }
                }
            }
        }
    }
}
