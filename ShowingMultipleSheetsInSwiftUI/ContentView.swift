//
//  ContentView.swift
//  ShowingMultipleSheetsInSwiftUI
//
//  Created by Ramill Ibragimov on 15.08.2022.
//

import SwiftUI

struct Product {
    let id: UUID
    let name: String
}

enum Sheets: Identifiable {
    case add
    case detail(Product)
    
    var id: String {
        switch self {
        case .add:
            return "add"
        case .detail(let product):
            return product.id.uuidString
        }
    }
}

struct ContentView: View {
    
    @State private var activeSheet: Sheets?
    
    var body: some View {
        VStack {
            Button("Show Add") {
                activeSheet = .add
            }
            
            Button("Show Details") {
                activeSheet = .detail(Product(id: UUID(), name: "MacBooks"))
            }
        }.sheet(item: $activeSheet) { sheet in
            switch sheet {
            case .add:
                Text("ADD")
            case .detail(let product):
                Text(product.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
