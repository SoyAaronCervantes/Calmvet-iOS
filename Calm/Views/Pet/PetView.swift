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
                VStack( alignment: .leading ) {
                    
                    Image( systemName: "tortoise.fill" )
                        .resizable()
                        .scaledToFit()
                        .frame( width: 344, height: 194, alignment: .center )
                        .foregroundColor(.green)
                        .padding(.bottom, 16)
                    
                    Text( petViewModel.pet.name )
                        .font(.title3 )
                        .foregroundColor( Color.black )
                    
                    Text( "Edad: \( petViewModel.pet.age )" )
                        .font(.headline)
                        .foregroundColor( Color.black )
                        .padding(.vertical, 8)
                    
                    Text( petViewModel.pet.description )
                        .font(.body)
                        .foregroundColor( Color.black )
                        .lineLimit(4)
                }
                .padding(32)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .center )
            )
    }
}
