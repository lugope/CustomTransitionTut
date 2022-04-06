//
//  ContentView.swift
//  CustomTransitionExample
//
//  Created by Lucas Pereira on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack{
            if !show {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Reading time: 20 mins")
                        .font(.headline)
                        .matchedGeometryEffect(id: "description", in: namespace)
                    
                    Text("Custom Transition")
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle.bold())
                }
                .padding(20)
                .background(
                    Color(UIColor.systemGray4).matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                )
                .padding(20)
                
            } else {
                VStack(alignment: .center, spacing: 12) {
                    Text("Custom Transition")
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .font(.largeTitle.bold())
                    
                    Text("Reading time: 20 mins")
                        .font(.headline)
                        .matchedGeometryEffect(id: "description", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                .padding(20)
                .background(
                    Color(UIColor.systemGray5).matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                )
            }
        }
        .onTapGesture {
            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
