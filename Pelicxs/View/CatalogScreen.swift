//
//  CatalogScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 16/03/25.
//
import SwiftUI

struct CatalogScreen: View {
    
    @State private var showMenu = false
    @State private var selectedTab = 0
    @State var navigationTitle: String
    @State var isSelected = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if selectedTab == 0 {
                    CatalogMovieView()
                } else if selectedTab == 1 {
                    ManagmentScreen(selectedTap: $selectedTab)
                } else if selectedTab == 2 {
                    RegisterScreen()
                }
                
                SideMenuView(isShowing: $showMenu, selectedTap: $selectedTab, isSelected: $isSelected, navigationTitle: $navigationTitle)
            }
            .padding(.top)
            .toolbar(showMenu ? .hidden : .visible)
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        showMenu.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                }
            }
        }
    }
}

struct CatalogMovieView: View {
    
    @StateObject var datos = FirebaseViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                let total = datos.datos.count
                let filas = stride(from: 0, to: total, by: 2).map { ($0, $0 + 1) }
                ForEach(filas, id: \.0) { firstIndex, secondIndex in
                    HStack(spacing: 16) {
                        CardMovieView(
                            titulo: datos.datos[firstIndex].titulo,
                            imagen: datos.datos[firstIndex].imagen,
                            año: datos.datos[firstIndex].año,
                            genero: datos.datos[firstIndex].genero,
                            director: datos.datos[firstIndex].director,
                            sinopsis: datos.datos[firstIndex].sinopsis
                        )

                        if secondIndex < datos.datos.count {
                            CardMovieView(
                                titulo: datos.datos[secondIndex].titulo,
                                imagen: datos.datos[secondIndex].imagen,
                                año: datos.datos[secondIndex].año,
                                genero: datos.datos[secondIndex].genero,
                                director: datos.datos[secondIndex].director,
                                sinopsis: datos.datos[secondIndex].sinopsis
                            )
                        } else {
                            Spacer()
                                .frame(width: 185, height: 300)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            datos.getAllData()
        }
    }
}

struct CardMovieView: View {
    
    @State var show = false
    var titulo: String
    var imagen: String
    var año: String
    var genero: String
    var director: String
    var sinopsis: String
    
    var body: some View {
        Button {
            show.toggle()
        } label: {
            VStack {
                
                ImageFirebase(imageUrl: imagen)
                
                Text(titulo)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                    .lineLimit(1)
                    .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                }.foregroundStyle(.yellow)
            }
        }
        .frame(width: 185, height: 300)
        .sheet(isPresented: $show) {
            ModalScreen(imagen: imagen, titulo: titulo, año: año, genero: genero, director: director, sinopsis: sinopsis)
        }
    }
}

#Preview{
    CatalogScreen(navigationTitle: "Catalogo de Peliculas")
}
