//
//  SearchBar.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var completion: () -> Void

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Buscar en Mercado Libre", text: $text, onEditingChanged: { editing in
                    withAnimation {
                        self.isEditing = editing
                    }
                })
                .onSubmit {
                    completion()
                    isEditing = false
                }
                .submitLabel(.search)
                if isEditing {
                    Button {
                        self.text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("GrayShade"))
                    }
                }
            }
            .padding(6)
            .padding(.horizontal, 10)
            .background(Color("White"))
            .cornerRadius(50)
            if isEditing {
                Button {
                    withAnimation {
                        self.isEditing = false
                    }
                } label: {
                    Text("Cancelar")
                        .foregroundColor(.black)
                }
                .transition(.move(edge: .trailing))
            }
        }
    }
}
