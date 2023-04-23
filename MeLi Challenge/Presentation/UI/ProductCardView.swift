//
//  ProductCardView.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import SwiftUI

struct ProductCardView: View {
    var data: Product

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image(url: data.thumbnailID))) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 130, height: 130)
            VStack(alignment: .listRowSeparatorLeading, spacing: 5) {
                Text(data.title)
                    .foregroundColor(Color("Black"))
                    .multilineTextAlignment(.leading)
                Text("$\(data.price.formattedWithSeparator)")
                    .foregroundColor(Color("Black"))
                    .font(.title)
                if data.shipping.freeShipping {
                    Text("Envío gratis")
                        .foregroundColor(Color("Green"))
                        .bold()
                }
                if let store = data.officialStoreName {
                    Text("Vendido por \(store)")
                        .foregroundColor(.gray)
                }
                Text("\(data.soldQuantity) vendidos")
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(
                alignment: .top
            )
        }
        .padding(10)
        .frame(
            maxWidth: .infinity, alignment: .leading
        )
    }
    fileprivate func image(url: String) -> String {
        return "https://http2.mlstatic.com/D_NQ_NP_\(url)-V.webp"
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(data: Product.example)
    }
}
