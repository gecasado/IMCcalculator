//
//  menuView.swift
//  cursoSwift
//
//  Created by Gerardo Casado on 28/6/25.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: IMCView()) {
                    Text("IMC CALCULATOR")
                }
                

                
            }
        }
    }
}

#Preview {
    menuView()
}
