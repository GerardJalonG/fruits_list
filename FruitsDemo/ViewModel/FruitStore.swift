import Foundation
class FruitStore:ObservableObject{
    
    @Published var fruits = loadFruits()
    
    static func loadFruits()->[Fruit]{
        return FruitStore.defaultFruits
    }
    
    static var defaultFruits = [
        Fruit(name: "Apple", emoji: .apple, description: "Apples help your body develop resistance against infections"),
        Fruit(name: "Pineapple", emoji: .pineapple, description: "Pineapples help fight arthritis"),
        Fruit(name: "Watermelon", emoji: .watermelon, description: "Watermelon helps control your heart rate"),
    ]
    
    static let defaultFruit =  Fruit(name: "Watermelon", emoji: .watermelon, description: "Watermelon helps control your heart rate")
    
    func add(_ fruit: Fruit) {
        fruits.append(fruit)
    }
    
    func remove(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    func exists(_ fruit: Fruit) -> Bool {
        fruits.contains { $0.name.lowercased() == fruit.name.lowercased() }
    }

}
