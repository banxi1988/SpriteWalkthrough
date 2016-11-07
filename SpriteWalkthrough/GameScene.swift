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
    case spaceship = "spaceship"
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
    let spaceship = makeSpaceshipNode()
    spaceship.position = CGPoint(x: frame.midX, y: frame.midY - 120)
    addChild(spaceship)
    
  }
  
  func makeSpaceshipNode() -> SKSpriteNode{
    let hull = SKSpriteNode(imageNamed: "Spaceship")
    
    let light1 = makeLightNode()
    light1.position = CGPoint(x: -55, y: 6)
    hull.addChild(light1)
    
    let light2 = makeLightNode()
    light2.position = CGPoint(x: 55, y: 6)
    hull.addChild(light2)
    
    let hover = SKAction.sequence([
        SKAction.wait(forDuration: 1.0),
        SKAction.moveBy(x: 100, y: 50, duration: 1.0),
        SKAction.wait(forDuration: 1.0),
        SKAction.moveBy(x: -100, y: -50, duration: 1.0)
      ])
    hull.run(SKAction.repeatForever(hover))
    

    
    return hull
  }
  
  
  func makeLightNode() -> SKSpriteNode{
    let light = SKSpriteNode(color: .yellow, size: CGSize(width: 8, height: 8))
    let blink = SKAction.sequence([
        SKAction.fadeOut(withDuration: 0.25),
        SKAction.fadeIn(withDuration: 0.25)
      ])
    let blinkForever = SKAction.repeatForever(blink)
    light.run(blinkForever)
    return light
  }
}
