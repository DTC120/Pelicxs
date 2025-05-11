//
//  ModalScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 22/03/25.
//

import SwiftUI

struct ModalScreen: View {
    
    var imagen : String
    var titulo : String
    var año: String
    var genero: String
    var director: String
    var sinopsis: String
    
    var body: some View {
        VStack {
            ImageFirebase(imageUrl: imagen)
            
            Spacer().frame(height: 16)
            
            Divider()
            
            Text(titulo)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom, 5)
            
            Text(año)
                .font(.caption)
                .padding(.bottom)
            
            HStack {
                VStack {
                    Text("Genero: \(genero)")
                        .padding(.bottom, 3)
                    Text("Director: \(director)")
                }
                Spacer()
            }
            
            HStack{
                Image(systemName: "popcorn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                
                Text("80%")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.trailing, 30)
                
                Image("tomate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
                Text("40%")
                    .font(.system(size: 30))
                    .bold()
                
                Spacer()
                
            }
            .padding(.vertical)
            
            HStack {
                Text("Sinopsis")
                    .font(.title2)
                    .bold()
                    .underline()
                    .padding(.bottom, 5)
                    
                    Spacer()
                }
                Text(sinopsis)
        }
        .padding()
    }
}
