//
//  ContentView.swift
//  Apple Music
//
//  Created by Yasmin Kaline on 23/05/23.
//


import SwiftUI

struct ContentView: View {
    @State private var backgroundColor: UIColor = .clear
    private let image = "back"
    
    var body: some View {

        ZStack {
            Color(backgroundColor).ignoresSafeArea()


        }.edgesIgnoringSafeArea(.all)
            .onAppear {self.setAverageColor()}
            
    }
    
    //Devolve a cor média
    private func setAverageColor() {
        let uiColor = UIImage(named: image)?.averageColor
        backgroundColor = uiColor ?? .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

