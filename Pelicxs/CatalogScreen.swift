//
//  CatalogScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 16/03/25.
//

import SwiftUI

struct CatalogScreen: View {
    var body: some View {
        
        ScrollView{
            TopTitleView(titulo: "Catalogo de Peliculas")
            
            VStack {
                HStack {
                    CardMovieView()
                    CardMovieView()
                }
                HStack {
                    CardMovieView()
                    CardMovieView()
                }
                HStack {
                    CardMovieView()
                    CardMovieView()
                }
                HStack {
                    CardMovieView()
                    CardMovieView()
                }
            }
        }.scrollIndicators(.hidden)
    }
}

struct CardMovieView: View {
    
    @State var show = false
    
    var body: some View {
        Button {
            show.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black)
                .frame(width: 185, height: 300)
                .overlay(
                VStack{
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 150, height: 175)
                        .foregroundStyle(.black)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Text("Nombre de la Pelicula")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding(.bottom, 10)
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }.foregroundStyle(.yellow)
                }
            )
        }
        .sheet(isPresented: $show) {
            ModalScreen()
        }
    }
}

#Preview {
    CatalogScreen()
}
