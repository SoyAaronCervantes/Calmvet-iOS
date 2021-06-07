//
//  MyPetsListView.swift
//  calmvet
//
//  Created by Aarón Cervantes Álvarez on 23/05/21.
//

import SwiftUI
import Firebase

struct MyPetListView: View {
    @ObservedObject var petListViewModel: PetListViewModel
    private let user = Auth.auth().currentUser
    var body: some View {
        List {
            ForEach(
                petListViewModel
                    .petsViewModel
                    .filter{ $0.pet.createdBy == user!.uid }
            ) { petViewModel in
                PetView( petViewModel: petViewModel )
            }
        }
    }
}

struct MyPetsListView_Previews: PreviewProvider {
    static var previews: some View {
        let user = Auth.auth().currentUser!
        Group {
            MyPetListView( petListViewModel: PetListViewModel( user.uid )  ).previewDevice("iPhone 12 Pro Max")
            MyPetListView( petListViewModel: PetListViewModel( user.uid ) ).previewDevice("iPhone X")
            MyPetListView( petListViewModel: PetListViewModel( user.uid ) ).previewDevice("iPhone SE (2nd generation)")
        }
    }
}
