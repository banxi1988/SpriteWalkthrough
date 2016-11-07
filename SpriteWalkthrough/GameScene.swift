//
//  GameScene.swift
//  SpriteWalkthrough
//
//  Created by Haizhen Lee on 11/7/16.
//  Copyright © 2016 banxi1988. All rights reserved.
//


import SpriteKit
import GameplayKit

enum NodeIdentifier:String{
    case hello = "hello"
}

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
    helloNode.name = NodeIdentifier.hello.rawValue
    return helloNode
  }
  
  override func touchDown(atPoint pos: CGPoint) {
    guard let helloNode = childNode(withName: NodeIdentifier.hello.rawValue) else {
        return
    }
    let moveAction = createMoveAction()
    helloNode.run(moveAction){
      let spaceshipScene = SpaceShipScene(size: self.size)
      let transition = SKTransition.doorsOpenVertical(withDuration: 0.5)
      self.view?.presentScene(spaceshipScene, transition: transition)
    }
  }
  
  func createMoveAction() -> SKAction{
    let moveUp = SKAction.moveBy(x: 0, y: 100, duration: 0.5)
    let zoom = SKAction.scale(to: 2.0, duration: 0.5)
    let pause = SKAction.wait(forDuration: 0.5)
    let fadeAway = SKAction.fadeOut(withDuration: 0.25)
    let remove = SKAction.removeFromParent()
    return SKAction.sequence([moveUp, zoom, pause, fadeAway, remove])
      
  }
}

class SpaceShipScene: BaseScene{
  override func onCreateSceneContents() {
    super.onCreateSceneContents()
    backgroundColor = .black
    scaleMode = .aspectFit
    
  }
}
