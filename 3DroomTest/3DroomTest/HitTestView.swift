//
//  HitTest.swift
//  3DroomTest
//
//  Created by Marco Rapp on 04.09.22.
//

import SwiftUI
import SceneKit



class ScenekitClass {
    
    let view = SCNView()
    let scene = SCNScene(named: "MainScene.scn")!
    
    let cameraNode = SCNNode()
    let lightNode = SCNNode()
    
    
    
    init() {
        setUpScene()
    }
    
    func setUpScene(){
        
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 12, z: 0)
        cameraNode.rotation = SCNVector4(1, 0, 0, Float.pi*1.5)
        
        
        lightNode.light = SCNLight()
        scene.rootNode.addChildNode(lightNode)
        lightNode.position = SCNVector3(0, 10, 0)
        
        
        var hallway:SCNNode
        hallway = scene.rootNode.childNode(withName: "hallway", recursively: true)!
        hallway.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
        hallway.runAction(SCNAction.move(to: SCNVector3(0, 0, 0), duration: 0))

        
        // attach the scene
        view.scene = scene
        
        // allows the user to manipulate the camera
        view.allowsCameraControl = false
        
        // show statistics such as fps and timing information
        view.showsStatistics = false
        
        // configure the view
        view.backgroundColor = UIColor.clear
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // @EnvironmentObject var viewModel:ViewModel
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: view)
        let hitResults = view.hitTest(p, options: [:])
        // check that we clicked on at least one object
        
        
        print("hit")
        
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result = hitResults[0]
            
            ViewModel.main.data.selectedRoom = result.node.name!                 // Here I want to change my Text to the node's name as soon as the object has been tapped. This is where the error occures.
            
            // get material for selected geometry element
            let material = result.node.geometry!.firstMaterial
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            
            // on completion - unhighlight
            SCNTransaction.completionBlock = {
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                material?.emission.contents = UIColor.black
                
                SCNTransaction.commit()
            }
            material?.emission.contents = UIColor.green
            
            SCNTransaction.commit()
        }
    }
}


struct ScenekitView : UIViewRepresentable {
    
    
    let scenekitClass = ScenekitClass()
    
    func makeUIView(context: Context) -> SCNView {
        return scenekitClass.view
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
    }
}


