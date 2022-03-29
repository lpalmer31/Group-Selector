//
//  ContentView.swift
//  Group Selector
//
//  Created by Adrian Devezin on 11/9/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject
    var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        Text(viewModel.groups)
            .padding()
        
        Button {
            viewModel.createGroups()
        } label: {
            Text("Generate Groups")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
