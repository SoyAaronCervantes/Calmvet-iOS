//
//  PetsView.swift
//  calmvet
//
//  Created by Aarón Cervantes Álvarez on 23/05/21.
//

import SwiftUI
import Firebase

struct PetListView: View {
    @ObservedObject var petListViewModel: PetListViewModel
    private let user = Auth.auth().currentUser
    var body: some View {
        List( petListViewModel.pets ) { pet in
            Text( pet.name )
        }
    }
}

struct PetListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PetListView( petListViewModel: PetListViewModel() ).previewDevice("iPhone 12 Pro Max")
            PetListView( petListViewModel: PetListViewModel() ).previewDevice("iPhone X")
            PetListView( petListViewModel: PetListViewModel() ).previewDevice("iPhone SE (2nd generation)")
        }
        
    }
}
