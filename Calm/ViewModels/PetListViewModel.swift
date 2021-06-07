//
//  PetListViewModel.swift
//  calmvet
//
//  Created by Aarón Cervantes Álvarez on 04/06/21.
//

import SwiftUI
import Combine

final class PetListViewModel: ObservableObject {
    @Published var petRepository = PetRepository()
    @Published var pets: [Pet] = []
    @Published var userPets: [Pet] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        petRepository.$pets
            .assign(to: \.pets, on: self)
            .store(in: &cancellables)
    }
    
    init( _ uid: String ) {
        petRepository.$userPets
            .assign(to: \.userPets, on: self)
            .store(in: &cancellables)
    }
    
    func add( _ pet: Pet ) {
        petRepository.add(pet)
    }
}
