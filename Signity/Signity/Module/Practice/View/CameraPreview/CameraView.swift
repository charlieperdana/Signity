//
//  CameraView.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    var processLandmarksHandler: ([Hand]) -> Void
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let cameraVC = CameraViewController()
        cameraVC.processLandmarksHandler = processLandmarksHandler
        
        return cameraVC
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
}
