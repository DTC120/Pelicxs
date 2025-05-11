//
//  CustomTextFieldStyle.swift
//  Pelicxs
//
//  Created by Diego Trejo on 19/04/25.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct CustomTextFieldStyle: ViewModifier {
    
    @State var ancho: CGFloat
    @State var alto: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: ancho, height: alto)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .stroke(.black)
            )
            .multilineTextAlignment(.center)
    }
}
