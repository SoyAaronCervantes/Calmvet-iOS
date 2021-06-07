//
//  ContentView.swift
//  Calm
//
//  Created by Aarón Cervantes Álvarez on 05/06/21.
//

import SwiftUI
import Firebase

struct CalmvetView: View {
    @State private var tabSelection = 1
    private let user = Auth.auth().currentUser
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                PetListView( petListViewModel: PetListViewModel() )
                    .tabItem { Image(systemName: "tortoise.fill") }
                    .tag(1)
                MyPetListView( petListViewModel: PetListViewModel( user?.uid ?? "" ) )
                    .tabItem { Image(systemName: "heart.fill") }
                    .tag(2)
            }
            // global, for all child views
            .navigationBarTitle(Text(navigationBarTitle), displayMode: .automatic)
            .navigationBarHidden(navigationBarHidden)
            .navigationBarItems(trailing: navigationBarTrailingItems)
        }
    }
}

struct CalmvetView_Previews: PreviewProvider {
    static var previews: some View {
        CalmvetView()
    }
}

private extension CalmvetView {
    var navigationBarTitle: String {
        if tabSelection == 1 {
            return "En Adopción"
        }

        if tabSelection == 2 {
            return "Mis mascotas"
        }

        return ""

    }
    
    var navigationBarHidden: Bool {
        tabSelection > 2
    }
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        if tabSelection <= 2 {
            NavigationLink( destination: PetFormView() ) {
                Image(systemName: "plus.circle")
            }
        }
    }
}
