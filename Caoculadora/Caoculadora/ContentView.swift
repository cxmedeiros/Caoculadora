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
    @State var porteSelecionado: Porte = .pequeno
    
    var body: some View {
        
        VStack(alignment: .leading) { //alinhar os texto para a esquerda
            Text("Qual a idade do seu cão?")
                .font(.header5)
                //.padding()
            
            Spacer()
            Text("Anos")
                .font(.body1)
            TextField(
            "Quantos anos completos seu cão tem.",
             value: $years,
             format: . number
            )
            
            Text("Meses")
                .font(.body1)
            TextField(
                "E quantos meses além disso ele tem.",
                value: $months,
                format: . number
            )
            
            Text("Porte")
                .font(.body1)
            Picker("Porte", selection: $porteSelecionado) {
                ForEach(Porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue) // rawValue pega o valor associado ao tipo string, o capitalizes faz as primeiras letras serem maiusculas
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
                        .font(.body1)
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
        
        result = porteSelecionado.conversaoDeIdade(anos: years, meses: months)
        
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
