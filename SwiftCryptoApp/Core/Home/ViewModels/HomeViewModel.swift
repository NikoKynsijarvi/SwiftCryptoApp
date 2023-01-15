//
//  HomeViewModel.swift
//  SwiftCryptoApp
//
//  Created by Niko Kynsijärvi on 15.1.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()

    init(){
        fetchCoinData()
    }
    
    func fetchCoinData (){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data = data else {return}
            let dataAsString = String(data:data, encoding: .utf8)
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let error {
             print("DEOBUG: Error \(error)")
            }
        
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {
            $0.priceChangePercentage24H > $1.priceChangePercentage24H
        })
        
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
