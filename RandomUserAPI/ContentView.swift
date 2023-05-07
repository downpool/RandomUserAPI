//
//  ContentView.swift
//  RandomUserAPI
//
//  Created by 최동현 on 2023/05/06.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
//        List(0...100, id: \.self) { index in
//            RandomUserRowView()
//
//        }
        
        List(randomUserViewModel.randomUsers) { aRandomUser in
            RandomUserRowView(aRandomUser)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
