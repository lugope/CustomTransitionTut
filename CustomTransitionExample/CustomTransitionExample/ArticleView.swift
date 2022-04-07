//
//  ArticleView.swift
//  CustomTransitionExample
//
//  Created by Lucas Pereira on 06/04/22.
//

import SwiftUI

struct ArticleView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
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
                        .font(.title.bold())
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
                ZStack {
                    VStack(alignment: .center, spacing: 12) {
                        Text("Custom Transition")
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .font(.title.bold())
                        
                        Text("Reading time: 20 mins")
                            .font(.headline)
                            .matchedGeometryEffect(id: "description", in: namespace)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        
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
                    
                    Button {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            show.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.body.weight(.bold))
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(20)
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        ArticleView(namespace: namespace, show: .constant(false))
    }
}
