//
//  UpdateStore.swift
//  FirstApp
//
//  Created by Sannan Hafeez on 28/03/20.
//  Copyright © 2020 Sannan Hafeez. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
