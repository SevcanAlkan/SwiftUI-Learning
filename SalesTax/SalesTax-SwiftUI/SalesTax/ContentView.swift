//
//  ContentView.swift
//  SalesTax
//
//  Created by Sevcan Alkan on 27.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @State var beforeTaxPriceStr: String = "";
    @State var salesTaxRateStr: String = "";
    @State var totalPriceStr: String = "";
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Sales Tax Calculator")
                    .font(.largeTitle)
                    .foregroundStyle(Color .blue)
            }.padding(.bottom, 20)
            
            HStack {
                Label("Before Tax Price", systemImage: "")
                TextField("$0", text: $beforeTaxPriceStr)
                    .keyboardType(.decimalPad)
            }.padding(.bottom, 20)
            
            HStack {
                Label("Tax Rate", systemImage: "")
                TextField("20.0%", text: $salesTaxRateStr)
                    .keyboardType(.decimalPad)
            }.padding(.bottom, 20)
            
            HStack {
                Label("Price With Tax", systemImage: "")
                TextField("", text: $totalPriceStr)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }.padding(.bottom, 20)
            
            Button("Calculate") {
                if let beforeTaxPrice = Float(beforeTaxPriceStr),
                   let salesTaxRate = Float(salesTaxRateStr) {
                    
                        let taxAmount = beforeTaxPrice * salesTaxRate / 100
                        let totalPrice = beforeTaxPrice + taxAmount
                    
                        totalPriceStr = String(totalPrice)
                    
                } else {
                    totalPriceStr = String("0")
                }
            }.buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
