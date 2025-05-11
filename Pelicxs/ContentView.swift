//
//  ContentView.swift
//  Pelicxs
//
//  Created by Diego Trejo on 14/03/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View {
        return Group {
            if loginShow.show {
                CatalogScreen(navigationTitle: "Catalogo de peliculas")
            }else{
                LoginScreen()
            }
        }.onAppear{
            if (UserDefaults.standard.object(forKey: "sesion")) != nil {
                loginShow.show = true
            }
        }
    }
}
