//
//  CircleGroupView.swift
//  Love&Care
//
//  Created by Youssef Eldeeb on 25/10/2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    var circleGroupColor: Color = .red
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZStack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}
