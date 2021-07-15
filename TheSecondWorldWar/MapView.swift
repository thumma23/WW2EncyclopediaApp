//
//  MapView.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 6/30/21.
//
import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var events: Events
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:
            52.5200, longitude: 13.4050),
        span: MKCoordinateSpan(
            latitudeDelta: 40, longitudeDelta: 40))
    var major_events = MajorEvents()
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: major_events.majorevents){
            event in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: event.lat, longitude: event.long)) {
                NavigationLink(destination:
                    ContentView(event: event)){
                    Image(systemName: "mappin")
                        .resizable()
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
            }
        }
        .navigationTitle("Major Events")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
