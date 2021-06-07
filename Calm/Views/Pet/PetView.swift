//
//  PetCardView.swift
//  Calm
//
//  Created by Aarón Cervantes Álvarez on 06/06/21.
//

import SwiftUI

struct PetView: View {
    var petViewModel: PetViewModel
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill( Color.white )
            .frame( height: 350 )
            .overlay(
                VStack {

                    Image( systemName: "tortoise.fill" )
                        .foregroundColor(.green)
                        .frame( height: 194 )

                    Text( petViewModel.pet.name )
                        .frame( alignment: .leading )
                        .font(.title)
                        .foregroundColor( Color.black )

                    Text( "Edad: \( petViewModel.pet.age )" )
                        .frame( alignment: .leading )
                        .font(.headline)
                        .foregroundColor( Color.black )

                    Text( petViewModel.pet.description )
                        .frame( alignment: .leading )
                        .font(.body)
                        .foregroundColor( Color.black )
                }
                .padding(16)
            )
    }
}
