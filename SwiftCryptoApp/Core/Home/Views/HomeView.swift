//
//  HomeView.swift
//  SwiftCryptoApp
//
//  Created by Niko Kynsijärvi on 15.1.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators:false) {
                //top movers view
                TopMoversView()
                Divider()
                //all coins view
                AllCoinsView()
                
            }
            .navigationTitle("Live prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
