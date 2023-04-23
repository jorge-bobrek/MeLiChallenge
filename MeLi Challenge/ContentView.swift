//
//  ContentView.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false

    var body: some View {
        if self.isActive {
            SearchProductView()
                .environmentObject(SearchProductViewModel())
        } else {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color("Background"))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
