//
//  CountryView.swift
//  TheSecondWorldWar
//
//  Created by Sahith Thumma on 7/1/21.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var events: Events
    @State var searchText = ""
    @State var searching = false
    @State var reset = false
    
    var body: some View {
        VStack(alignment: .leading){
            SearchBar(searchText: $searchText, searching: $searching, reset: $reset)
            List{
                ForEach(reset ? Search(searchText: searchText.lowercased()) : events.events, id: \.self){event in
                    NavigationLink(destination:ContentView(event: event)){
                        Text(event.EventName)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Search")
            .toolbar {
                if searching {
                    Button("Cancel") {
                        searchText = ""
                        reset = false
                        withAnimation {
                            searching = false
                            UIApplication.shared.dismissKeyboard()
                         }
                     }
                 }
            }
            .gesture(DragGesture()
                         .onChanged({ _ in
                             UIApplication.shared.dismissKeyboard()
                         })
             )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar: View {
    @Binding var searchText : String
    @Binding var searching : Bool
    @Binding var reset : Bool
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText) { startedEditing in
                     if startedEditing {
                        reset = true
                         withAnimation {
                             searching = true
                         }
                     }
                 } onCommit: {
                     withAnimation {
                         searching = false
                        reset = true
                     }
                 }
            }
            .foregroundColor(.black)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding(.leading)
        .padding(.trailing)
        
    }
}

func Search(searchText : String) -> [Event]{
    var results = [Event]()
    let events = Events()
    
    for event in events.events{
        if(event.EventName.lowercased().contains(searchText)){
            results.append(event)
        }
    }
    return results.removingDuplicates()
}



extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
