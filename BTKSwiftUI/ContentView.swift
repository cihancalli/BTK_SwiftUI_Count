//
//  ContentView.swift
//  BTKSwiftUI
//
//  Created by Cihan on 18.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State var count :Double = 0
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.count -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                })
                
                Text(formatNumber(count))
                    .font(.title)
                    
                
                Button(action: {
                    self.count += 1
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                })
            }
        }
        .padding()
    }
    
    var formattedString: String {
        switch count {
        case 0..<1_000:
            return "\(count)"
        case 1_000..<1_000_000:
            let kNumber = Double(count) / 1_000.0
            return String(format: "%.1fK", kNumber)
        case 1_000_000..<1_000_000_000:
            let mNumber = Double(count) / 1_000_000.0
            return String(format: "%.1fM", mNumber)
        case 1_000_000_000..<1_000_000_000_000:
            let mNumber = Double(count) / 1_000_000_000.0
            return String(format: "%.1fB", mNumber)
        default:
            return "\(count)"
        }
    }
    
    func formatNumber(_ number: Double) -> String {
         let formatter = NumberFormatter()
         formatter.numberStyle = .decimal
         formatter.minimumFractionDigits = 0
         formatter.maximumFractionDigits = 2

         // Büyük sayıları ayırmak için Türkçe ayırıcıları kullan
         formatter.groupingSeparator = "."
         formatter.decimalSeparator = ","

         return formatter.string(from: NSNumber(value: number)) ?? ""
     }
}

#Preview {
    ContentView()
}
