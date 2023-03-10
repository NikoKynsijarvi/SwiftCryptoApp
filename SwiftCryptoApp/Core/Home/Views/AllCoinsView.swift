//
//  AllCoinsView.swift
//  SwiftCryptoApp
//
//  Created by Niko Kynsijärvi on 15.1.2023.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var searchInput: String = ""
    
    var body: some View {
       
        VStack(alignment: .leading){
            HStack{
                Text("All Coins")
                    .font(.headline)
                    .padding()
                
                Spacer()
                TextField(
                    "Search",
                    text: $searchInput
                )
            }
            
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }.font(.caption).foregroundColor(.gray).padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(viewModel: HomeViewModel())
    }
}
