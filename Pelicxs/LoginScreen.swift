//
//  LoginScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 14/03/25.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var name:String = ""
    @State private var yearsOld:String = ""
    @State private var firstEmail:String = ""
    @State private var firtsPassword:String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                
                Text("Iniciar Sesion")
                    .font(.title)
                
                TextField("Correo electronico", text: $email)
                    .modifier(CustomTextFieldStyle(ancho: 300, alto: 50))
                SecureField("Contraseña", text: $password)
                    .modifier(CustomTextFieldStyle(ancho: 300, alto: 50))
                
                Button("Entrar"){
                    //Accion
                }.buttonStyle(CustomButtonStyle(widthButton: 130, heightButton: 50))
                    
                Divider()
                    .overlay(.black)
                    .padding(.horizontal)
                
                Text("¿No tienes una cuenta? Llena el siguiente formulario para crearla.")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                
                Text("Registrarse")
                    .font(.title)
                    .padding(.bottom)
                
                HStack {
                    Text("Nombre:")
                    TextField("", text: $name)
                        .modifier(CustomTextFieldStyle(ancho: 177, alto: 50))
                    
                    Text("Edad:")
                    TextField("", text: $yearsOld)
                        .modifier(CustomTextFieldStyle(ancho: 50, alto: 50))
                }
                HStack {
                    Text("Email:")
                    TextField("", text: $firstEmail)
                        .modifier(CustomTextFieldStyle(ancho: 307, alto: 50))
                }
                HStack {
                    Text("Contraseña:")
                    TextField("", text: $firtsPassword)
                        .modifier(CustomTextFieldStyle(ancho: 260, alto: 50))
                }
                
                Button("Crear"){
                    //Accion del boton
                }.buttonStyle(CustomButtonStyle(widthButton: 130, heightButton: 50))
            }
        }
    }
}

#Preview {
    LoginScreen()
}
