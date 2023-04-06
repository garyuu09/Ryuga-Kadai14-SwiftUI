//
//  ContentView.swift
//  Kadai14-SwiftUI
//
//  Created by Ryuga on 2023/04/06.
//

import SwiftUI

struct Fruit {
    var code = UUID()
    var name: String
    var isChecked: Bool
}

struct ContentView: View {
    @State private var showingModal = false
    @State var fruits = [
        Fruit(name: "りんご", isChecked: false),
        Fruit(name: "みかん", isChecked: true),
        Fruit(name: "バナナ", isChecked: false),
        Fruit(name: "パイナップル", isChecked: true)
    ]

    var body: some View {
        NavigationStack{
            List {
                ForEach(fruits, id: \.code) { fruit in
                    ZStack {
                        HStack{
                            Image(systemName: fruit.isChecked ? "checkmark" : "")
                                .foregroundColor(Color.orange)
                            Spacer()
                        }
                        HStack {
                            Spacer().frame(width: 30)
                            Text(fruit.name)
                            Spacer()
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingModal = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .fullScreenCover(isPresented: $showingModal) {
                        AddItemView(fruits: $fruits)
                    }
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
