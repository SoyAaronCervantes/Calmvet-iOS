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
    var body: some View {
        List {
            ForEach( petListViewModel.userPetsViewModel ) { petViewModel in
                PetView( petViewModel: petViewModel )
                    .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .center )
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
