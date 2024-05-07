//
//  ContentView.swift
//  Caoculadora
//
//  Created by Camila Xavier de Medeiros on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil // para aparecer o texto logo
    @State var months: Int? = nil
    
    var body: some View {
        
        VStack(alignment: .leading) { //alinhar os texto para a esquerda
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            Text("Anos")
            TextField(
            "Quantos anos completos seu cão tem.",
             value: $years,
             format: . number
            )
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem.",
                value: $months,
                format: . number)
        
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
