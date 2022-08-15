//
//  ContentView.swift
//  CreateWithSwift
//
//  Created by Paul Mooney on 8/11/22.
//

import SwiftUI

struct DetailView<Content: View>: View {
    var title: String
    var urlHost: String
    var content: () -> Content // change to closure
    
    // add all parameters in the init
    init(title: String, urlHost: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.urlHost = urlHost
        self.content = content
    }
    
    var body: some View {
        VStack {
            Image(systemName: title)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(urlHost)
        }
        .padding()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
