//
//  FirebaseViewModel.swift
//  Pelicxs
//
//  Created by Diego Trejo on 11/04/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class FirebaseViewModel: ObservableObject {
    @Published var show = false
    @Published var datos = [FirebaseModel]()
    
    //BASES DE DATOS
    
    //Inicio de Sesión
    func login(email:String, password:String, completion: @escaping (_ done: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("Entro")
                completion(true)
            }else{
                if let error = error?.localizedDescription {
                    print("Error en firebase", error)
                }else{
                    print("Error en la app")
                }
            }
        }
    }
    
    //Creacion de Cuenta
    func createUser(email:String, password:String, completion: @escaping (_ done: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("Entro y se registro")
                completion(true)
            }else{
                if let error = error?.localizedDescription {
                    print("Error en firebase de registro", error)
                }else{
                    print("Error en la app")
                }
            }
        }
    }
    
    //Guardar Registro de Peliculas
    func save (titulo:String, año:String, director:String, genero:String, sinopsis:String, imagen:Data, completion: @escaping (_ done: Bool) -> Void) {
        
        let storage = Storage.storage().reference()
        let nombreImagen = UUID()
        let directorio = storage.child("imagenes/\(nombreImagen)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directorio.putData(imagen, metadata: metadata) { data, error in
            if let error = error {
                print("Fallo al subir la imagen al storage: \(error.localizedDescription)")
                completion(false)
                return
            }

            directorio.downloadURL { url, error in
                if let error = error {
                    print("No se pudo obtener la URL de descarga: \(error.localizedDescription)")
                    completion(false)
                    return
                }

                guard let imageURL = url?.absoluteString else {
                    print("URL de imagen no válida")
                    completion(false)
                    return
                }

                // GUARDAR TEXTO EN FIRESTORE
                let db = Firestore.firestore()
                let id = UUID().uuidString
                let campos: [String: Any] = [
                    "titulo": titulo,
                    "año": año,
                    "director": director,
                    "genero": genero,
                    "sinopsis": sinopsis,
                    "imagen": imageURL
                ]

                db.collection(genero).document(id).setData(campos) { error in
                    if let error = error {
                        print("Error al guardar en Firestore: \(error.localizedDescription)")
                        completion(false)
                    } else {
                        print("Guardo todo correctamente")
                        completion(true)
                    }
                }
            }
        }
    }
    
    func getData(genero: String){
        let db = Firestore.firestore()
        db.collection(genero).addSnapshotListener { QuerySnapshot, error in
            if let error = error?.localizedDescription{
                print("error al mostrar datos ", error)
            }else{
                self.datos.removeAll()
                for document in QuerySnapshot!.documents {
                    let valor = document.data()
                    let id = document.documentID
                    let titulo = valor["titulo"] as? String ?? "sin titulo"
                    let año = valor["año"] as? String ?? "sin año"
                    let director = valor["director"] as? String ?? "sin director"
                    let sinopsis = valor["sinopsis"] as? String ?? "sin sinopsis"
                    let imagen = valor["imagen"] as? String ?? "sin imagen"
                    let genero = valor["genero"] as? String ?? "sin genero"
                    DispatchQueue.main.async{
                        let registros = FirebaseModel(id: id, titulo: titulo, año: año, director: director, sinopsis: sinopsis, imagen: imagen, genero: genero)
                        self.datos.append(registros)
                    }
                }
            }
        }
    }
    
    func getAllData() {
        let db = Firestore.firestore()
        let generos = ["Acción", "Comedia", "Terror", "Ciencia Ficcion", "Romance"]
        
        self.datos.removeAll()
        
        for genero in generos {
            db.collection(genero).getDocuments { snapshot, error in
                if let error = error?.localizedDescription {
                    print("Error obteniendo datos de \(genero):", error)
                } else {
                    for document in snapshot!.documents {
                        let valor = document.data()
                        let id = document.documentID
                        let titulo = valor["titulo"] as? String ?? "sin titulo"
                        let año = valor["año"] as? String ?? "sin año"
                        let director = valor["director"] as? String ?? "sin director"
                        let sinopsis = valor["sinopsis"] as? String ?? "sin sinopsis"
                        let imagen = valor["imagen"] as? String ?? "sin imagen"
                        let genero = valor["genero"] as? String ?? "sin genero"
                        DispatchQueue.main.async {
                            let registro = FirebaseModel(id: id, titulo: titulo, año: año, director: director, sinopsis: sinopsis, imagen: imagen, genero: genero)
                            self.datos.append(registro)
                        }
                    }
                }
            }
        }
    }
}
