
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore:FruitStore
    var body: some View {
        List(fruitStore.fruits){ fruit in
            FruitRowView(fruit: fruit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FruitStore())
    }
}
