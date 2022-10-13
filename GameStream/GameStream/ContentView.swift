//
//  ContentView.swift
//  GameStream
//
//  Created by user213492 on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            VStack{
                
                InicioYRegistroView()
                
                
                
            }
        }
        
    }
}

struct InicioYRegistroView:View {
    var body : some View{
        VStack {
            
            HStack {
                Text("INICIA SESION")
                Text("REGISTRATE")
                
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
