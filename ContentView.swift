//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Liko Setiawan on 23/03/24.
//

import SwiftUI


struct Response: Codable{
    var results : [Result]
}

struct Result: Codable {
    var trackId : Int
    var trackName : String
    var collectionName : String
}

struct ContentView: View {
//    @State private var results = [Result]()
    
    @State private var email = ""
    @State private var username = ""
    
    var disableForm: Bool{
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form{
            Section{
                TextField("Username", text: $username)
                TextField("Email", text: $email )
            }
            
            Section{
                Button("Create Account"){
                    print("Create Account...")
                }
            }
            .disabled(disableForm)
        }
//        AsyncImage(url: URL(string: "https://hws.dev/img/log.png")) { phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image check the URL.")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){image in
//            image
//                .resizable()
//                .scaledToFit()
//        }placeholder: {
//            Color.red
//        }
//        .frame(width: 200, height: 200)
//        List(results, id: \.trackId){ item in
//            VStack(alignment: .leading){
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
    }
    
    
//    func loadData() async{
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else{
//            print("Invalid URL")
//            return
//        }
//        do{
//            let(data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
//                results = decodedResponse.results
//            }
//        }catch{
//            print("Invalid data")
//        }
//    }
}

#Preview {
    ContentView()
}
