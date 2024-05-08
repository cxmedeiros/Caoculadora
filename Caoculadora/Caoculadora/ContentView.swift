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
    @State var result: Int?
    
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
                format: . number
            )
            Text("Porte")
            // aqui tem o segmented control
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 30))
            } else {
                Image(.dog)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
            }
            Button(action: {
                result = 23
            }, label: {
                ZStack {
                    Color(.blue)
                    Text("Cãocular")
                        .foregroundStyle(.white)
                }
            })
            .cornerRadius(10)
            .frame(height: 50)
            
            
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
