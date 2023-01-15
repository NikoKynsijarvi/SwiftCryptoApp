//
//  TopMoversView.swift
//  SwiftCryptoApp
//
//  Created by Niko Kynsijärvi on 15.1.2023.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Top movers")
                .font(.headline)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(0 ..< 5, id: \.self){_ in
                        TopMoversItemView()
                    }
                }
            }
        }
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
