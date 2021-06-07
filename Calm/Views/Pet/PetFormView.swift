//
//  PetFormView.swift
//  calmvet
//
//  Created by Aarón Cervantes Álvarez on 25/05/21.
//

import SwiftUI

struct PetFormView: View {
    @ObservedObject private var pet = PetForm()
    
    @State private var selectedAnimalIndex = 0
    @State private var selectedGenreIndex = 0
    
    private var animals = ["Perro", "Gato", "Cuyo", "Hurón", "Conejo", "Pato"]
    private var genres = ["Masculino", "Femenino"]

    var body: some View {
        Form {
            Section( header: Text("Datos de la mascota") ) {
                TextField("Nombre de la mascota", text: $pet.name)
                TextField("Edad de la mascota", text: $pet.age)
                    .keyboardType(.numberPad)
                CustomPickerView("¿Qué animal es?", animals, index: $selectedAnimalIndex)
                CustomPickerView("¿Cuál es su genero?", genres, index: $selectedGenreIndex)
            }
            
            Section( header: Text("¿Qué lo hace tan especial") ) {
                TextEditor(text: $pet.description)
                    .frame(height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            Section {
                Button("Agregar foto", action: submitPet)
            }

        }
        .navigationTitle("Agregar mascota")
    }
    
    
    private func submitPet() {
        if !validateInputs() { return }
        
    }
    
    private func validateInputs() -> Bool {
        if pet.name.isEmpty {
            return false
        }
        
        if pet.age.isEmpty {
            return false
        }
        
        if pet.description.isEmpty {
            return false
        }
        
        
        return true
    }
    
}

struct PetFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PetFormView().previewDevice("iPhone X")
            PetFormView().previewDevice("iPhone 8 Plus")
            PetFormView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}
