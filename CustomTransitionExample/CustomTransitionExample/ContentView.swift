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
        ZStack {
            ScrollView {
                Text("Articles")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
                    .padding(20)
                
                if !show {
                    ArticleView(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                                show.toggle()
                            }
                        }
                }
            }
            
            if show {
                ArticleView(namespace: namespace, show: $show)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
