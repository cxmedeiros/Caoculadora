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
    @State var  failedInput = false
    let titulopreencherCampos =  "Preencha os campos para poder cãocular!"
    @State var zeroInput = false
    let tituloCamposComZero = "Um dos campos tem que estar diferente de zero."
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) { //alinhar os texto para a esquerda
                    Text("Qual a idade do seu cão?")
                        .foregroundColor(.indigo600)
                        .font(.header5)
                        .padding(.top, 24)
                    
                   // Spacer()
                    
                    VStack (alignment: .leading, spacing:  8.0) {
                        Text("Anos")
                            .foregroundColor(.indigo600)
                            .font(.body1)
                        TextField(
                            "Quantos anos completos seu cão tem.",
                            value: $years,
                            format: . number
                        )
                    }
                    
                    VStack (alignment: .leading, spacing:  8.0) {
                        Text("Meses")
                            .foregroundColor(.indigo600)
                            .font(.body1)
                        TextField(
                            "E quantos meses além disso ele tem.",
                            value: $months,
                            format: . number
                        )
                    }
                    
                    VStack (alignment: .leading, spacing:  8.0) {
                        Text("Porte")
                            .foregroundColor(.indigo600)
                            .font(.body1)
                        Picker("Porte", selection: $porteSelecionado) {
                            ForEach(Porte.allCases, id: \.self) { porte in
                                Text(porte.rawValue) // rawValue pega o valor associado ao tipo string, o capitalizes faz as primeiras letras serem maiusculas
                                    .tag(porte)
                            }
                        }
                        .pickerStyle(.segmented)
                        //.padding()
                    }
                    
                    Divider()
                        .background(.blue)
                    
                    if let result {
                        Spacer()
                        Text("Seu cachorro tem, em idade humana...")
                            .foregroundColor(.indigo600)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .font(.body1)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .foregroundColor(.indigo600)
                            .font(.display)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
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
                            Color(.indigo600)
                            Text("Cãocular")
                                .font(.body1)
                                .foregroundStyle(.white)
                        }
                    })
                    .cornerRadius(10)
                    .frame(height: 50)
                    
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                .alert(titulopreencherCampos ,isPresented: $failedInput) {
                    Button("OK", role: .cancel, action:  {})
                }
                .alert(tituloCamposComZero, isPresented: $zeroInput){
                    Button("OK", role: .cancel, action: {})
                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    func processYears () {
        
        //guard só é usado em funçoes ou equivalentes
        guard
            let years,
            let months
        else {
            print("Preencha o campo de entrada")
            failedInput = true
            return
        }
        
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            zeroInput =  true
            return
        }
        
//        guard let years else {
//
//            return
//        }
        
//        if let years {
//            result = years * 7
//        }
        
        withAnimation(.easeIn) {
            result = porteSelecionado.conversaoDeIdade(anos: years, meses: months)
        }
    }
}

#Preview {
    ContentView()
}
