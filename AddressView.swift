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
            
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
