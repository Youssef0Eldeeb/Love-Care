//
//  ContentView.swift
//  Love&Care
//
//  Created by Youssef Eldeeb on 24/10/2022.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    //Body
    var body: some View {
        
        if isOnboarding{
           Onboarding()
        }else{
            Home()
        }
        
    }//: body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
