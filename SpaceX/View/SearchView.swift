//
//  SearchView.swift
//  SpaceX
//
//  Created by Rajneesh on 08/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import SwiftUI

struct SearchView : View {
    @State private var searchText: String = ""
    @EnvironmentObject var SpaceXVM: SpaceXViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    SearchBar(text: $searchText)
                    List(SpaceXVM.launches.filter({ searchText.isEmpty ? true : $0.mission_name.contains(searchText) })) { item in
                        NavigationLink(destination: DetailView(launchDetail: item)){
                            SearchViewRow(launchDetail: item)
                        }
                    }
                }
            }.navigationBarTitle("SpaceX Launches")
        }
        .onAppear(perform: self.fetch)
        
    }
    
    private func fetch() {
        SpaceXVM.getAllLaunches()
    }
}

struct SearchViewRow : View {
    let launchDetail : Launch
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                HStack {
                    Text(launchDetail.mission_name).font(.title).fontWeight(.light)
                    Spacer()
                    Divider()
                    Text(launchDetail.launch_year)
                }
            }
        }
    }
}


