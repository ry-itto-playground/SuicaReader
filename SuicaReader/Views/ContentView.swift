//
//  ContentView.swift
//  SuicaReader
//
//  Created by 伊藤凌也 on 2019/09/15.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI
import CoreNFC

struct ContentView: View {
    let reader = FelicaReader()

    var body: some View {
        Button("hoge", action: {
            self.reader.beginReadNFC()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
