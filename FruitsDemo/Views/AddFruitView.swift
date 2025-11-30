import SwiftUI

struct AddFruitView: View {
    
    @Binding var sheetIsVisible: Bool
    @Binding var sheetAction: SheetAction
    @Binding var newFruit:Fruit
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $newFruit.name)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $newFruit.description)
                }
                Section(header: Text("Image")) {
                    EmojiPicker(emoji: $newFruit.emoji)
                        //TODO: .listRowInsets(EdgeInsets())
                }
            }
            .navigationTitle("Add Fruit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        sheetAction = .cancel
                        sheetIsVisible = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        sheetAction = .add
                        sheetIsVisible = false
                    }
                }
            }
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(sheetIsVisible: .constant(true),
            sheetAction: .constant(.cancel),
            newFruit: .constant(FruitStore.defaultFruit)
        )
        AddFruitView(sheetIsVisible: .constant(true),
            sheetAction: .constant(.cancel),
            newFruit: .constant(FruitStore.defaultFruit)
        )
        .preferredColorScheme(.dark)
        AddFruitView(sheetIsVisible: .constant(true),
            sheetAction: .constant(.cancel),
            newFruit: .constant(FruitStore.defaultFruit)
        )
        .previewLayout(.fixed(width: 480, height: 320))
    }
}
