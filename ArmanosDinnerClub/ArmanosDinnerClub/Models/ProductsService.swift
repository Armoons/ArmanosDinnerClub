import Foundation

class ProductsService {
    
    static var shared = ProductsService()
    
    private let userDefaults = UserDefaults.standard
    
    private init() {
        let notFirstLaunch = userDefaults.bool(forKey: Keys.notFirstLaunch.rawValue)
        if !notFirstLaunch {
            userDefaults.set(true, forKey: Keys.notFirstLaunch.rawValue)
            writeDefaultProducts()
        }
    }
    
    func settingDescription(){
        
    }
    
    func writeDefaultProducts() {
        let productsArray = [
            Product(name: "Бургер", price: 130, type: .burger, description: "Картофель Фри - это порция хрустящик, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля."),
            Product(name: "Картоха", price: 54, type: .chips, description: "Картофель Фри - это порция хрустящик, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля."),
            Product(name: "Твистер", price: 175, type: .burger, description: "Картофель Фри - это порция хрустящик, золотистых, обжаренных в растительном фритюре и слегка посоленных соломок отборного картофеля.")
        ]
        
        for product in productsArray {
            addNew(product: product)
        }
    }
    
    func allProducts() -> [Product] {
        var result: [Product] = []
        for index in 0..<productsCount() {
            let key = "\(index)"
            let productData = userDefaults.string(forKey: key) ?? ""
            if let product = Product(string: productData) {
                result.append(product)
            }
        }
        return result
    }
    
    func addNew(product: Product) {
        let key = "\(productsCount())"
        userDefaults.set(product.toString(), forKey: key)
        userDefaults.set(productsCount() + 1, forKey: Keys.productsCount.rawValue)
    }
    
    func productsCount() -> Int {
        userDefaults.integer(forKey: Keys.productsCount.rawValue)
    }
    
    enum Keys: String {
        case notFirstLaunch
        case productsCount
    }
}
