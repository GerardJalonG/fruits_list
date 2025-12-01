
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
    
    @State private var newFruit = FruitStore.defaultFruit
    
    @State private var alertaDuplicado = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(fruitStore.fruits) { fruit in
                    NavigationLink(destination: DetailFruitView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                    }
                }.onDelete(perform: fruitStore.remove(at:))
            }.navigationBarTitle(Text("Fruits"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+") {
                        newFruit = FruitStore.defaultFruit
                        sheetIsVisible = true
                    }
                }
            }
            .sheet(isPresented: $sheetIsVisible){
                AddFruitView(sheetIsVisible: $sheetIsVisible,
                sheetAction: $sheetAction, newFruit: $newFruit)
            }
        }
    }
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(FruitStore())
        }
    }
}
