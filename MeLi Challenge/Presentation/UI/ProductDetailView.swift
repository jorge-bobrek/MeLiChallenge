//
//  ProductDetailView.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var detail: Product

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                }
                .padding(20)
                Spacer()
            }
            .background(Color("Background"))
            .frame(
                maxWidth: .infinity
            )
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 0) {
                            Text("\(conditionText(detail.condition))")
                                .font(.footnote)
                            if detail.soldQuantity > 0 {
                                Text(" ￨ \(detail.soldQuantity) vendidos")
                                    .font(.footnote)
                            }
                            Spacer()
                        }
                        Text(detail.title)
                            .padding(.vertical, 10)
                        HStack {
                            AsyncImage(url: URL(string: image(url: detail.thumbnailID))) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 300, height: 300, alignment: .center)
                        }
                        .frame(maxWidth: .infinity)
                        if let ogp = detail.originalPrice {
                            Text("$ \(ogp.formattedWithSeparator)")
                                .foregroundColor(.gray)
                                .font(.body)
                                .strikethrough()
                        }
                        Text("$ \(detail.price.formattedWithSeparator)")
                            .font(.largeTitle)
                        if detail.tags.contains("deal_of_the_day") {
                            Text("OFERTA DEL DÍA")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(Color("White"))
                                .padding(5)
                                .background(Color("Blue"))
                                .cornerRadius(5)
                        }
                    }
                    .padding(20)
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Características")
                            .font(.title2)
                        Grid(alignment: .leading, horizontalSpacing: 0, verticalSpacing: 0) {
                            ForEach(Array(detail.attributes.enumerated()), id: \.offset) { index, attribute in
                                if let value = attribute.valueName {
                                    GridRow {
                                        Text(attribute.name)
                                            .font(.headline)
                                            .bold()
                                        Text(value)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                    .background(index % 2 == 0 ? Color("GrayRow") : Color("White"))
                                }
                            }
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("Gray"), lineWidth: 1)
                        )
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }
    fileprivate func image(url: String) -> String {
        return "https://http2.mlstatic.com/D_NQ_NP_2X_\(url)-F.webp"
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detail: Product.example)
    }
}
