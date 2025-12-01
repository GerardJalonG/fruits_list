import SwiftUI

struct AddFruitView: View {
    
    @Binding var sheetIsVisible: Bool
    @Binding var sheetAction: SheetAction
    @Binding var newFruit:Fruit
    
    @State private var showDuplicateAlert = false
    
    @EnvironmentObject var fruitStore: FruitStore
    
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
                    EmojiPicker(emoji: $newFruit.emoji).listRowInsets(EdgeInsets())
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
                        let added = fruitStore.add(newFruit)
                            if added {
                                sheetIsVisible = false
                            } else {
                                showDuplicateAlert = true
                            }
                    }
                }
            }
            .alert(isPresented: $showDuplicateAlert) {
                Alert(
                    title: Text("Esta fruta ya existe"),
                    dismissButton: .cancel(Text("OK"))
                )
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
