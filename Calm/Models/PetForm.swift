//
//  PetForm.swift
//  calmvet
//
//  Created by Aarón Cervantes Álvarez on 04/06/21.
//

import SwiftUI
import Combine

class PetForm: ObservableObject {
    @State var name: String = ""
    @State var description: String = ""
    @State var age: String = ""
    @State var genre: String = ""
    @State var animal: String = ""
}
