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
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte : String = "Pequeno"
    
    var body: some View {
        
        VStack(alignment: .leading) { //alinhar os texto para a esquerda
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
                //.padding()
            
            Spacer()
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
            Picker("Porte", selection: $porte) {
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Divider()
                .background(.blue)
            
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 30))
            } else {
                Spacer()
                Image(.dog)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 20)
            }
            Spacer()
            Button(action: processYears, label: {
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
    
    
    func processYears () {
        
        //guard só é usado em funçoes ou equivalentes
        guard
            let years,
            let months
        else {
            print("Preencha o campo de entrada")
            return
        }
        
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            return
        }
        
        result = years * 7 + months * 7 / 12
//        guard let years else {
//            
//            return
//        }
        
//        if let years {
//            result = years * 7
//        }
    }
}

#Preview {
    ContentView()
}
