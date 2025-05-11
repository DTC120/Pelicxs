//
//  LoginScreen.swift
//  Pelicxs
//
//  Created by Diego Trejo on 14/03/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginScreen: View {
    
    @State private var email:String = ""
    @State private var password:String = ""
    @StateObject var login = FirebaseViewModel()
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View {
        ZStack{
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                
                
                VStack(spacing: -10) {
                    Text("Inicia sesión")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text("o")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text("Crea una cuenta")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .padding(.vertical, 30)
                
                TextField("Correo electronico", text: $email)
                    .modifier(CustomTextFieldStyle(ancho: 300, alto: 50))
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Contraseña", text: $password)
                    .modifier(CustomTextFieldStyle(ancho: 300, alto: 50))
                    .padding(.bottom, 30)
                
                Button("Entrar") {
                    login.login(email: email, password: password) { done in
                        if done{
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }
                .padding(.bottom)
                .buttonStyle(CustomButtonStyle(size: 26, foregroundStyle: .white, background: .black, widthButton: 180, heightButton: 60))
                
                Button("Crear") {
                    login.createUser(email: email, password: password) { done in
                        if done{
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }
                .buttonStyle(CustomButtonStyle(size: 26, foregroundStyle: .white, background: .black, widthButton: 180, heightButton: 60))
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
