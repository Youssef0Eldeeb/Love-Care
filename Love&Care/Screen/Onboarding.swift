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
    @State var isAnimating: Bool = false
    @State var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    @State var buttonOffset: CGFloat = 0.0
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 60
    
    //Body
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            VStack{
                // MARK: - Header
                VStack{
                    Text(abs(imageOffset.width) > 0 ? "Care." : "Love")
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
                .offset(y: isAnimating ? 0 : -50)
                .animation(.easeOut(duration: 1), value: isAnimating)
                Spacer()
                // MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width)/5)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 30)
                        .scaleEffect(isAnimating ? 1 : 0.8)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundColor(.white)
                                .opacity(abs(imageOffset.width)>0 ? 0 : 1)
                            ,alignment: .bottom
                        )
                        .frame(width: 350, alignment: .center)
                        .offset(x: imageOffset.width, y: 0)
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if abs(gesture.translation.width) <= 150 {
                                    imageOffset = gesture.translation
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation {
                                        imageOffset = .zero
                                    }
                                })
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
                            .frame(width: 80 + buttonOffset)
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
                        .offset(x: buttonOffset)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if (gesture.translation.width > 0.0) && (buttonOffset <= buttonWidth - 80){
                                buttonOffset = gesture.translation.width
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        if buttonOffset >= buttonWidth / 2{
                                            isOnboarding = false
                                        }else{
                                            buttonOffset = 0.0
                                        }
                                    }
                                })
                        )
                        
                        Spacer()
                    }//: HStack
                }//: ZStack
                .frame(height: 80, alignment: .center)
                .padding(.horizontal, 30)
                .offset(y: isAnimating ? 0 : 50)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }//: ZStack
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
