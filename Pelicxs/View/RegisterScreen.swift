//
//  RegisterSreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 28/03/25.
//

import SwiftUI

struct RegisterScreen: View {
    
    @State var titulo:String = ""
    @State var año:String = ""
    @State var director:String = ""
    var categorias = ["Acción", "Comedia", "Terror", "Ciencia Ficcion", "Romance"]
    @State private var genero = "Acción"
    @State var sinopsis:String = ""
    @State var imagen:String = ""
    @StateObject var guardar = FirebaseViewModel()
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack{
                    VStack {
                        NavigationLink(destination: ImagePicker(show: $imagePicker, image: $imageData, source: source), isActive: $imagePicker){
                            EmptyView()
                        }.navigationBarHidden(true)
                        
                        Text("Para dar de Alta una pelicula favor de llenar los siguientes datos:")
                            .padding(.bottom, 50)
                            .font(.system(size: 20))
                        
                        VStack(alignment: .leading) {
                            HStack {
                                CustomTextView(texto: "Titulo:")
                                TextField("", text: $titulo)
                                    .modifier(CustomTextFieldStyle(ancho: 275, alto: 50))
                                    .padding(.leading, 22)
                            }
                            HStack {
                                CustomTextView(texto: "Año:")
                                TextField("", text: $año)
                                    .modifier(CustomTextFieldStyle(ancho: 70, alto: 50))
                                    .padding(.leading, 37)
                            }
                            HStack {
                                CustomTextView(texto: "Director:")
                                TextField("", text: $director)
                                    .modifier(CustomTextFieldStyle(ancho: 260, alto: 50))
                                    .padding(.leading, 2)
                            }
                            HStack {
                                CustomTextView(texto: "Genéro:")
                                Picker("Genero", selection: $genero){
                                    ForEach(categorias, id:\.self){item in
                                        Text(item)
                                    }
                                }
                            }
                            HStack {
                                CustomTextView(texto: "Sinopsis:")
                                TextEditor(text: $sinopsis)
                                    .frame(width: 270, height: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(.black, lineWidth: 2)
                                    )
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15)
                                    )
                            }
                        }
                        
                        Button{
                            mostrarMenu.toggle()
                        } label: {
                            Text("Seleccionar Imagen")
                                .font(.caption)
                                .fontWeight(.heavy)
                                .foregroundStyle(.black)
                                .padding(7)
                                .border(.black)
                                .background(.gray)
                        }.padding(.vertical, 20)
                            .actionSheet(isPresented: $mostrarMenu, content:  {
                                ActionSheet(title: Text("Menu"), message: Text("Selecciona una opcion"), buttons: [
                                    .default(Text("Camara"), action: {
                                        source = .camera
                                        imagePicker.toggle()
                                    }),
                                    .default(Text("Libreria"), action: {
                                        source = .photoLibrary
                                        imagePicker.toggle()
                                    }),
                                    .default(Text("Cancelar"))
                                ])
                                
                            })
                        
                        if imageData.count != 0 {
                            Image(uiImage: UIImage(data: imageData)!)
                                .resizable()
                                .frame(width: 150, height: 175)
                                .cornerRadius(15)
                            
                            Button("Subir"){
                                guardar.save(titulo: titulo, año: año, director: director, genero: genero, sinopsis: sinopsis, imagen: imageData) { done in
                                    if done {
                                        titulo = ""
                                        año = ""
                                        director = ""
                                        sinopsis = ""
                                        imageData = .init(capacity: 0)
                                    }
                                }
                            }
                            .padding()
                            .buttonStyle(CustomButtonStyle(size: 26, foregroundStyle: .white, background: .black, widthButton: 170, heightButton: 60))
                        }
                        Spacer()
                    }
                }
            }.scrollIndicators(.hidden)
        }
    }
}

struct CustomTextView: View {
    
    @State var texto:String
    
    var body: some View {
        Text(texto)
            .padding(.horizontal, 5)
            .font(.system(size: 20))
    }
}

#Preview {
    RegisterScreen()
}
