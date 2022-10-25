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
    @State var isAnimatting: Bool = false
    let feedback = UINotificationFeedbackGenerator()
    
    //Body
    var body: some View {
        VStack(alignment: .center, spacing: 50){
            ZStack{
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, alignment: .center)
                    .offset(y: isAnimatting ? 30 : -30)
                    .animation(.easeOut(duration: 2).repeatForever(autoreverses: true), value: isAnimatting)
            }//: ZStack
            
            Text("Having children just puts the whole world into perspective. Everything else just disappears")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundColor(.gray)
            
            
            Button {
                isOnboarding.toggle()
                playSound(soundFile: "success", soundType: "m4a")
                feedback.notificationOccurred(.success)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
        }//: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+2 ) {
                isAnimatting.toggle()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
