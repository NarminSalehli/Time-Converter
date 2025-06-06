//
//  ContentView.swift
//  Time turning
//
//  Created by Nərmin Salehli on 03.06.25.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredNumber = 0.0
    @State private var inputUnits = 1
    @State private var outputUnits = 2
    
    let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    
    var result: Double {
        let inputInSeconds: Double
        switch inputUnits {
        case 0: inputInSeconds = enteredNumber
        case 1: inputInSeconds = enteredNumber * 60
        case 2: inputInSeconds = enteredNumber * 3600
        case 3: inputInSeconds = enteredNumber * 86400
        default: inputInSeconds = 0
        }
        switch  outputUnits {
        case 0: return inputInSeconds
        case 1: return inputInSeconds / 60
        case 2: return inputInSeconds / 3600
        case 3: return inputInSeconds / 86400
        default: return 0
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter a number", value: $enteredNumber, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("SELECT INPUT UNIT") {
                    Picker("Input Unit", selection: $inputUnits) {
                        ForEach(0..<timeUnits.count, id: \.self) {
                            Text(timeUnits[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("SELECT OUTPUT UNIT") {
                    Picker("Output units", selection: $outputUnits) {
                        ForEach(0..<timeUnits.count, id: \.self) {
                            Text(timeUnits[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("RESULT") {
                    Text("\(result, specifier: "%.2f") \(timeUnits[outputUnits])")
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}

#Preview {
    ContentView()
}
