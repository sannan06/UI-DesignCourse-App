//
//  UpdateDetail.swift
//  FirstApp
//
//  Created by Sannan Hafeez on 28/03/20.
//  Copyright © 2020 Sannan Hafeez. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[2]
    
    var body: some View {
        ScrollView {
            VStack() {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .navigationBarTitle(update.title)
        }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
