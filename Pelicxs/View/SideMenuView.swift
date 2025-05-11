//
//  SideMenuView.swift
//  Pelicxs
//
//  Created by Diego Trejo on 18/04/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SideMenuView: View {
    
    @EnvironmentObject var loginShow : FirebaseViewModel
    @Binding var isShowing: Bool
    @Binding var selectedTap: Int
    @Binding var isSelected: Bool
    @Binding var navigationTitle: String
    
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea(.all)
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        VStack {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(.white)
                                    .frame(width: 48, height: 48)
                                    .background(.blue)
                                    .clipShape(Circle())
                                    .padding(.vertical)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Usuario")
                                        .font(.subheadline)
                                    
                                    if let email = Auth.auth().currentUser?.email {
                                        Text(email)
                                            .font(.footnote)
                                            .tint(.gray)
                                    }
                                }
                                Spacer()
                            }.padding(.bottom, 50)
                            
                            Button("Catalogo de peliculas"){
                                selectedTap = 0
                                isShowing.toggle()
                                navigationTitle = "Catalogo de peliculas"
                                
                            }.buttonStyle(isSelected ? CustomButtonStyle(size: 20, foregroundStyle: .white, background: .blue, widthButton: 240, heightButton: 50) : CustomButtonStyle(size: 20, foregroundStyle: .blue, background: .gray.opacity(0.1), widthButton: 240, heightButton: 50))
                            
                            Button("Administracion"){
                                selectedTap = 1
                                isShowing.toggle()
                                navigationTitle = "Administracion"
                                
                            }.buttonStyle(isSelected ? CustomButtonStyle(size: 20, foregroundStyle: .white, background: .blue, widthButton: 240, heightButton: 50) : CustomButtonStyle(size: 20, foregroundStyle: .blue, background: .gray.opacity(0.1), widthButton: 240, heightButton: 50))
                                .padding(.vertical, 30)
                            
                            Button("Cambiar tema"){
                                
                            }.buttonStyle(CustomButtonStyle(size: 20, foregroundStyle: .blue, background: .gray.opacity(0.1), widthButton: 240, heightButton: 50))
                            
                            Spacer()
                            
                            Button{
                                try! Auth.auth().signOut()
                                UserDefaults.standard.removeObject(forKey: "sesion")
                                loginShow.show = false
                            }label: {
                                HStack {
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                    
                                    Text("Cerrar sesión")
                                    
                                }.foregroundStyle(.red)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
    }
}
