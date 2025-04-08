//
//  ContentView.swift
//  Pelicxs
//
//  Created by Diego Trejo on 14/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginScreen()
    }
}

struct TopTitleView: View {
    
    var titulo:String
    
    var body: some View {
    
    Rectangle()
        .stroke(.black)
        .frame(height: 70)
        .overlay(
            Text(titulo)
                .font(.title)
        )
        .overlay(
            Button {
                //Accion del boton
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
            }.offset(x:-175, y:0)
        )
    }
}

struct CustomTextFieldStyle: ViewModifier {
    
    @State var ancho: CGFloat
    @State var alto: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(.gray.opacity(0.2))
            .multilineTextAlignment(.center)
            .frame(width: ancho, height: alto)
            .overlay(
                VStack {
                    Divider()
                        .overlay(.black)
                        .padding(.top, 40)
                }
                
            )
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    var widthButton:CGFloat
    var heightButton:CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.system(size: 25))
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .frame(width: widthButton, height: heightButton)
            .background(.black)
            .cornerRadius(15)
            .padding()
    }
}

#Preview {
    ContentView()
}
