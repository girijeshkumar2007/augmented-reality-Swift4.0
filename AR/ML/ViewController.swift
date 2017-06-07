//
//  ViewController.swift
//  ML
//
//  Created by Girijesh Kumar on 06/06/17.
//  Copyright © 2017 Girijesh Kumar. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        configuration.planeDetection = .horizontal
        
        providing2DVirtualContent()

        // Run the view's session
        sceneView.session.run(configuration)
        
        
       // let sknode2 = ARAnchor()
       // sceneView.anchor(for: sknode2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func providing2DVirtualContent() -> Void {
        
        // Create a transform with a translation of 0.2 meters in front of the camera.
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.2
        let transform = simd_mul((sceneView.session.currentFrame?.camera.transform)!, translation)
        
        // Add a new anchor to the session.
        let anchor = ARAnchor(transform: transform)
        sceneView.session.add(anchor: anchor)
    }
}

extension ViewController: ARSKViewDelegate{
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode?{
        
            return SKLabelNode(text: "👾")
    }
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor)
    {
        
    }
    func view(_ view: ARSKView, willUpdate node: SKNode, for anchor: ARAnchor)
    {
        
    }
    func view(_ view: ARSKView, didUpdate node: SKNode, for anchor: ARAnchor)
    {
        
    }
    func view(_ view: ARSKView, didRemove node: SKNode, for anchor: ARAnchor)
    {
        
    }
}
