//
//  ContentView.swift
//  CustomTransitionExample
//
//  Created by Lucas Pereira on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack{
            if !show {
                Text("Custom Transition")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle.bold())
            } else {
                Text("Custom Transition")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.largeTitle.bold())
            }
        }
        .onTapGesture {
            withAnimation {
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
