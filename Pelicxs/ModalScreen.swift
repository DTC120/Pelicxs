//
//  ModalScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 22/03/25.
//

import SwiftUI

struct ModalScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 350, height: 300)
                .padding(.bottom)
            
            Divider()
            
            Text("Nombre de la pelicula")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom, 5)
            
            Text("Año de lanzamiento")
                .font(.caption)
                .padding(.bottom)
            
            HStack {
                VStack {
                    Text("Genero:")
                        .padding(.bottom, 3)
                    Text("Director:")
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
                Text("Lorem ipsum odor amet, consectetuer adipiscing elit. Aptent suspendisse facilisi facilisis suscipit sagittis. Non risus dictumst pharetra mauris etiam facilisi feugiat ultricies. ")
        }
        .padding()
    }
}

#Preview {
    ModalScreen()
}
