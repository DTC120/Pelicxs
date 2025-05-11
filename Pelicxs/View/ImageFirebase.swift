//
//  ImageFirebase.swift
//  Pelicxs
//
//  Created by Diego Trejo on 04/05/25.
//

import SwiftUI

struct ImageFirebase: View {
    
    let imagenAlternativa = UIImage(systemName: "photo")
    @ObservedObject var imageLoader : ImagenViewModel
    
    init(imageUrl: String) {
        imageLoader = ImagenViewModel(imageUrl: imageUrl)
    }
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: some View {
        Image(uiImage: image ?? imagenAlternativa!)
            .resizable()
            .frame(width: 150, height: 220)
            .foregroundStyle(.black)
            .cornerRadius(10)
    }
}
