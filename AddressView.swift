//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Liko Setiawan on 24/03/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order : Order
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zip)
            }
            Section{
                NavigationLink("Check Out"){
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
            
            Button("Test Save & Retrieve") {
                // Save the order to UserDefaults
                order.saveToUserDefaults()
                
                // Retrieve the order from UserDefaults
                if let retrievedOrder = Order.loadFromUserDefaults() {
                    // Print the retrieved order details
                    print("Retrieved Order:")
                    print("Name: \(retrievedOrder.name)")
                    print("Street Address: \(retrievedOrder.streetAddress)")
                    print("City: \(retrievedOrder.city)")
                    print("Zip Code: \(retrievedOrder.zip)")
                } else {
                    print("Error: Unable to retrieve order from UserDefaults.")
                }
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
