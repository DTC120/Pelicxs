//
//  ManagmentView.swift
//  Pelicxs
//
//  Created by Diego Trejo on 21/03/25.
//

import SwiftUI
import FirebaseFirestore

struct ManagmentScreen: View {
    
    @Binding var selectedTap: Int
    @StateObject var datos = FirebaseViewModel()
    @State private var seleccionadas: Set<String> = []
    
    var body: some View {
        ZStack {
            VStack {
                Text("Para dar de baja una pelicula selecciona la(s) pelicula(s) y presiona el boton Dar de baja")
                List {
                    ForEach(datos.datos) { pelicula in
                        HStack {
                            Button(action: {
                                if seleccionadas.contains(pelicula.id) {
                                    seleccionadas.remove(pelicula.id)
                                } else {
                                    seleccionadas.insert(pelicula.id)
                                }
                            }) {
                                Circle()
                                    .strokeBorder(seleccionadas.contains(pelicula.id) ? Color.blue : Color.gray, lineWidth: 2)
                                    .background(Circle().fill(seleccionadas.contains(pelicula.id) ? Color.blue : Color.clear))
                                    .frame(width: 24, height: 24)
                            }

                            Text("\(pelicula.titulo) | \(pelicula.año)")
                                .font(.body)
                                .foregroundStyle(.black)
                        }
                        .padding(.vertical, 8)
                    }
                }
                
                Spacer()
                
                Button("Dar de baja"){
                    for id in seleccionadas {
                        if let pelicula = datos.datos.first(where: { $0.id == id }) {
                            Firestore.firestore().collection(pelicula.genero).document(pelicula.id).delete { error in
                                if let error = error {
                                    print("Error al eliminar \(pelicula.titulo): \(error.localizedDescription)")
                                } else {
                                    print("Película eliminada: \(pelicula.titulo)")
                                    datos.getAllData()
                                }
                            }
                        }
                    }
                    seleccionadas.removeAll()
                }.buttonStyle(CustomButtonStyle(size: 26, foregroundStyle: .white, background: .black, widthButton: 350, heightButton: 50)).shadow(color: .black, radius: 7)
                
                Divider()
                    .frame(width: 370, height: 1)
                    .overlay(.black)
                    .padding(.bottom)
                
                Text("Para subir una nueva pelicula presiona el siguiente boton:")
                    .multilineTextAlignment(.center)
                
                Button{
                    selectedTap = 2
                } label: {
                    Text("Dar de alta")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                        .frame(width: 170, height: 50)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 3)
                            
                        )
                }
            }.onAppear {
                datos.getAllData()
            }
        }
    }
}

#Preview {
    ManagmentScreen(selectedTap: .constant(1))
}
