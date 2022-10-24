//
//  Home.swift
//  Love&Care
//
//  Created by Youssef Eldeeb on 25/10/2022.
//

import SwiftUI

struct Home: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //Body
    var body: some View {

        VStack{
            Button {
                isOnboarding.toggle()
            } label: {
                Text("Restart")
                    .font(.largeTitle)
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
