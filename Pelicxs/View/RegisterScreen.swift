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
    @State var genero:String = ""
    @State var sinopsis:String = ""
    @State var imagen:String = ""
    
    var body: some View {
        VStack{
            Divider()
                .overlay(.black)
            
            Text("Para dar de Alta una pelicula favor de llenar los siguientes datos:")
                .padding(.bottom, 50)
            
            HStack {
                Text("Titulo:")
                TextField("", text: $titulo)
                    .modifier(CustomTextFieldStyle(ancho: .infinity, alto: 50))
            }
            HStack {
                Text("Año:")
                TextField("", text: $año)
                    .modifier(CustomTextFieldStyle(ancho: 60, alto: 50))
                Spacer()
            }
            HStack {
                Text("Director:")
                TextField("", text: $director)
                    .modifier(CustomTextFieldStyle(ancho: .infinity, alto: 50))
            }
            HStack {
                Text("Genero:")
                TextField("", text: $genero)
                    .modifier(CustomTextFieldStyle(ancho: .infinity, alto: 50))
            }
            HStack {
                Text("Sinopsis:")
                TextEditor(text: $sinopsis)
                    .border(.black)
                    .frame(width: .infinity, height: 100)
            }
            HStack {
                Text("Imagen:")
                Button{
                    //Accion del boton
                } label: {
                    Text("Seleccionar Archivo")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.black)
                        .padding(5)
                        .border(.black)
                        .background(.gray)
                }
                Spacer()
            }
            
            Button("Subir"){
                //Accion del boton
            }
            .buttonStyle(CustomButtonStyle(widthButton: 170, heightButton: 50))
            .padding()
            
        }.padding()
        
        Spacer()
    }
}

#Preview {
    RegisterScreen()
}
