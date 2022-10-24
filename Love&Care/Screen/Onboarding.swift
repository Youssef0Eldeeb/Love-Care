//
//  Onboarding.swift
//  Love&Care
//
//  Created by Youssef Eldeeb on 25/10/2022.
//

import SwiftUI

struct Onboarding: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    //Body
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            VStack{
                // MARK: - Header
                VStack{
                    Text("Care.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("Life doesn't come with a manua, it comes with a mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                }//: VStack
                Spacer()
                // MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundColor(.white)
                            ,alignment: .bottom
                        )
                }//: ZStack
                Spacer()
                // MARK: - Footer
                ZStack{
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Start")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                    }//: HStack
                    
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }//: ZStack
                        .frame(width: 80, alignment: .center)
                        Spacer()
                    }//: HStack
                }//: ZStack
                .frame(height: 80, alignment: .center)
                .padding(.horizontal, 30)
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}