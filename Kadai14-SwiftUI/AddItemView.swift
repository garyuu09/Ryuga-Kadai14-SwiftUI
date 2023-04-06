//
//  AddItemView.swift
//  Kadai14-SwiftUI
//
//  Created by Ryuga on 2023/04/06.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var newItem = ""
    @Binding var fruits: [Fruit]
    //    @Binding var fruits: Array<Dictionary<String, Bool>>
    //    @Binding var fruits: Binding<[Fruit]>
    //    @Binding var fruits: Fruit
    //    色々試して、なんとか正解?にたどり着いたが少し、理解が甘い箇所のため要復習

    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    Text("名前")
                    TextField("", text: $newItem)
                        .modifier(CustomTextFieldStyle())
                }
                Spacer()
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !newItem.isEmpty {
                            fruits.append(Fruit(name: newItem, isChecked: false))
                            newItem = ""
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200, alignment: .trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct Preview: View {
    @State var fruits = [Fruit(name: "りんご", isChecked: false)]
    var body: some View {
        AddItemView(fruits: $fruits)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
