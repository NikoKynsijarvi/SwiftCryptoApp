//
//  AllCoinsView.swift
//  SwiftCryptoApp
//
//  Created by Niko Kynsijärvi on 15.1.2023.
//

import SwiftUI

struct AllCoinsView: View {
    var body: some View {
       
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                Spacer()
                Text("Price")
            }.font(.caption).foregroundColor(.gray).padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(0 ..< 50) { _ in
                        CoinRowView()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
