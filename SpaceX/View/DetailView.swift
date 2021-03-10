//
//  Webview.swift
//  SpaceX
//
//  Created by Rajneesh on 08/03/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let launchDetail : Launch
    var body: some View {
        VStack{
            RemoteImage(url: launchDetail.links?.mission_patch ?? "").padding()
            Divider()
            Text("Launch Details").font(.largeTitle)
            Divider()
            DetailRowView(title: "Name", description: launchDetail.mission_name)
            DetailRowView(title: "Year", description: launchDetail.launch_year)
            DetailRowView(title: "Rocket Name", description: launchDetail.rocket.name)
            DetailRowView(title: "Launch Location", description: launchDetail.launchSite?.siteName ?? "")
            Spacer()
        }
    }
}

struct DetailRowView: View {
    let title : String
    let description : String
    var body: some View {
        HStack() {
            Text(title).frame(alignment: .leading)
            Spacer()
            Text(description).frame(alignment: .trailing)
            
        }.padding()
    }
}
