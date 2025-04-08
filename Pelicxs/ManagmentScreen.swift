//
//  ManagmentView.swift
//  Pelicxs
//
//  Created by Diego Trejo on 21/03/25.
//

import SwiftUI

struct ManagmentScreen: View {
    var body: some View {
        TopTitleView(titulo: "Administracion")
        
        Text("Para dar de baja una pelicula selecciona la(s) pelicula(s) y presiona el boton Dar de baja")
        
        //List{}
        
        Spacer()
        
        Button("Dar de baja"){
            //Aqui va la accion
        }.buttonStyle(CustomButtonStyle(widthButton: 370, heightButton: 55)).shadow(color: .black, radius: 10)
        
        Divider()
            .frame(width: 370, height: 1)
            .overlay(.black)
            .padding(.bottom)
        
        Text("Si quieres subir una nueva pelicula presiona el boton Dar de alta")
            .multilineTextAlignment(.center)
        
        Button{
            //Aqui va la accion
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
            
    }
}

#Preview {
    ManagmentScreen()
}
