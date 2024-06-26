//
//  Order.swift
//  CupcakeCorner
//
//  Created by Liko Setiawan on 24/03/24.
//

import Foundation

@Observable
class Order: ObservableObject, Codable{
    
    func saveToUserDefaults(){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self){
            UserDefaults.standard.set(encoded, forKey: "SavedOrder")
        }
    }
    
    static func loadFromUserDefaults() -> Order?{
        if let data = UserDefaults.standard.data(forKey: "SavedOrder"){
            let decoder = JSONDecoder()
            if let decodedOrder = try? decoder.decode(Order.self, from: data){
                return decodedOrder
            }
        }
        return nil
    }
    
    enum CodingKeys: String, CodingKey{
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool{
        if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty{
            return false
        }
        return true
    }
    
    var cost: Double{
        // $2 cost per cupcakes
        var cost = Double(quantity) * 2
        
        //complicated cupcakes
        cost += (Double(type) / 2)
        
        // $1 for more frosting
        if extraFrosting{
            cost += Double(quantity)
        }
        
        // 0.50 cents for more sprinkles
        if addSprinkles{
            cost += Double(quantity) / 2
        }
        return cost
    }
}


extension String{
    var isReallyEmpty: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
