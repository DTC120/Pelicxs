//
//  ImagenViewModel.swift
//  Pelicxs
//
//  Created by Diego Trejo on 04/05/25.
//

import Foundation
import Firebase
import FirebaseStorage

class ImagenViewModel: ObservableObject {
    
    @Published var data : Data? = nil
    
    init(imageUrl: String) {
        let storageImage = Storage.storage().reference(forURL: imageUrl)
        storageImage.getData(maxSize: 1 * 2024 * 2024) { data, error in
            if let error = error?.localizedDescription {
                print("error al traer la imagen", error)
            }else{
                DispatchQueue.main.async{
                    self.data = data
                }
            }
        }
    }
}
