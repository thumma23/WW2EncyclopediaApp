//
//  TodayView.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/29/21.
//
import AVKit
import SwiftUI

struct EventView: View{
    @EnvironmentObject var events: Events
    @State var index = 0
    @State private var fadeInOut = false
    
    
    var body: some View{
        TabView(selection: self.$index){
            ForEach(events.events){i in
                    VStack{
                        NavigationLink(destination:
                            ContentView(event: i)){
                            VStack{
                                Text(i.EventName)
                                    .bold()
                                    .font(.largeTitle)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                Text(i.Date)
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                
                                Text(i.Location)
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                
                                Image(i.Description[0][1])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(25)
                                    .padding(.leading)
                                    .padding(.trailing)
                                
                                Text(i.Description[0][0])
                                    .padding()
                                
                            
                        }
                    }
                    .buttonStyle(FlatLinkStyle())
                            
                }
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding()
                
            }
            
        }
        .accentColor(Color.black)
        .background(Color.black.opacity(0.07).ignoresSafeArea())
        .tabViewStyle(PageTabViewStyle())
        .navigationTitle("Explore")
            
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
