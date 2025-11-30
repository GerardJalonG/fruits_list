
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation

enum SheetAction {
    case cancel
    case add
}

struct ContentView: View {
    @EnvironmentObject var fruitStore:FruitStore
    
    @State private var sheetIsVisible = false
    
    @State private var sheetAction: SheetAction = .cancel
    
    @State private var newFruit = Fruit(name: "",emoji: .apple,description: "")
    
    @State private var alertaDuplicado = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(fruitStore.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                    }
                }.onDelete(perform: remove)
            }.navigationBarTitle(Text("Fruits"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+") {
                        newFruit = Fruit(name: "",emoji: .apple, description: "");
                        sheetIsVisible = true
                    }
                }
            }
            .sheet(isPresented: $sheetIsVisible,onDismiss: onSheetDismiss){
                AddFruitView(sheetIsVisible: $sheetIsVisible,
                sheetAction: $sheetAction, newFruit: $newFruit)
            }
        }
    }
    
    func remove( at offsets: IndexSet){
        fruitStore.fruits.remove(atOffsets: offsets)
    }
    
    func onSheetDismiss() {
        if sheetAction == .add {fruitStore.fruits.append(newFruit)
            newFruit = Fruit(name: "", emoji: .apple, description: "")
                sheetAction = .cancel
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FruitStore())
    }
}
