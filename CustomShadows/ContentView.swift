//
//  ContentView.swift
//  CustomShadows
//
//  Created by Artem on 21.07.2023.
//

import SwiftUI


extension View {
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .overlay(self.blur(radius: radius/6))
            .shadow(color: color, radius: radius/3)
            .shadow(color: color, radius: radius/3)
            .shadow(color: color, radius: radius/3)
    }
}

extension View {
    func multicolorGlow() -> some View {
        ForEach(0..<2) { i in
            Rectangle()
                .fill(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.red]), center: .center))
                .frame(width: 400, height: 400)
                .mask(self.blur(radius: 20))
                .overlay(self.blur(radius: 5 - CGFloat(i*5)))
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
//            Circle()
//                .fill(Color.white)
//                .glow(color: .blue, radius: 36)
              
            Text("Hello World")
                .font(.system(size: 96, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 400, height: 300)
                .multicolorGlow()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
