//
//  SearchProductView.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import SwiftUI

struct SearchProductView: View {
    @EnvironmentObject var productViewModel: SearchProductViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Header()
                    .environmentObject(productViewModel)
                if productViewModel.isLoading {
                    SkeletonView()
                } else if productViewModel.products.count > 0 {
                    ProductsView(products: productViewModel.products)
                } else {
                    EmptyResultsView()
                }
                Spacer()
            }
        }
    }

    fileprivate struct Header: View {
        @EnvironmentObject var viewModel: SearchProductViewModel
        @State var searchText = ""

        var body: some View {
            HStack {
                SearchBar(text: $searchText) {
                    viewModel.search(query: searchText)
                }
                .padding(10)
            }
            .background(Color("Background"))
            .frame(
                maxWidth: .infinity
            )
            HStack {
                if viewModel.isLoading {
                    Text("0 resultados")
                        .redacted(reason: .placeholder)
                        .padding(20)
                } else {
                    Text("\(viewModel.paging.total.formattedWithSeparator) resultados")
                        .padding(20)
                }
                Spacer()
            }
            .background(Color.white
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                .mask(Rectangle().padding(.bottom, -10))
            )
            .padding(.bottom, 2)
        }
    }

    fileprivate struct ProductsView: View {
        let products: [Product]
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(products) { product in
                        NavigationLink {
                            ProductDetailView(detail: product)
                        } label: {
                            ProductCardView(data: product)
                        }
                        if product.id != products.last?.id {
                            Divider()
                        }
                    }
                }
            }
        }
    }

    fileprivate struct SkeletonView: View {
        var body: some View {
            ScrollView {
                VStack {
                    SkeletonItem()
                    Divider()
                    SkeletonItem()
                    Divider()
                    SkeletonItem()
                    Divider()
                    SkeletonItem()
                }
            }
        }
    }

    fileprivate struct SkeletonItem: View {
        var body: some View {
            HStack {
                Rectangle()
                    .fill(Color("Gray"))
                    .frame(width: 130, height: 130)
                VStack(alignment: .listRowSeparatorLeading, spacing: 5) {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec gravida.")
                        .redacted(reason: .placeholder)
                    Text("6900000")
                        .font(.title)
                        .redacted(reason: .placeholder)
                    Text("420 vendidos")
                        .redacted(reason: .placeholder)
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
    }

    fileprivate struct EmptyResultsView: View {
        var body: some View {
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("GrayShade"))
                Text("No encontramos publicaciones")
                    .font(.title2)
                Text("""
                    Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales.
                    """)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("GrayBackground"))
        }
    }
}

struct SearchProductView_Previews: PreviewProvider {
    static var previews: some View {
        SearchProductView()
            .environmentObject(SearchProductViewModel())
    }
}
