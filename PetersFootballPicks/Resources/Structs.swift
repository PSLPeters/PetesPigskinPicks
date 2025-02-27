//
//  Structs.swift
//  PigskinPicks
//
//  Created by Michael Peters on 2/11/25.
//

import SwiftUI
import SafariServices

// MARK: SafariWebView creation
struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
