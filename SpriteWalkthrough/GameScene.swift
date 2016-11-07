//
//  GameScene.swift
//  SpriteWalkthrough
//
//  Created by Haizhen Lee on 11/7/16.
//  Copyright © 2016 banxi1988. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameScene: BaseScene{
  
  override func onCreateSceneContents() {
    super.onCreateSceneContents()
    backgroundColor = SKColor.blue
    scaleMode = .aspectFit
    addChild(makeHelloNode())
  }
  
  func makeHelloNode() -> SKLabelNode{
    let helloNode = SKLabelNode(fontNamed: "Chalkduster")
    helloNode.text = "Hello World!"
    helloNode.fontSize = 42
    helloNode.position = CGPoint(x: frame.midX, y: frame.midY)
    
    return helloNode
  }
}
