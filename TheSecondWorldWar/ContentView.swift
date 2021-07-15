//
//  ContentView.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/28/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let event : Event
    @State var player = AVPlayer()
    var body: some View {
        Text(event.EventName)
            .foregroundColor(Color.black)
            .bold()
            .font(.largeTitle)
            .multilineTextAlignment(.center)
        Text(event.Date)
            .font(.title2)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
        
        Text(event.Location)
            .font(.title3)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
        ScrollView{
            ForEach(event.Description, id:\.self){para in
                Image(para[1])
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .padding(.leading)
                    .padding(.trailing)
                
                Text(para[0])
                    .foregroundColor(Color.black)
                    .padding()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(event: Events().events[0])
    }
}
