//
//  BaseScene.swift
//  SpriteWalkthrough
//
//  Created by Haizhen Lee on 11/7/16.
//  Copyright © 2016 banxi1988. All rights reserved.
//

import Foundation


import SpriteKit
import GameplayKit

class BaseScene: SKScene {
  
  private var lastUpdateTime : TimeInterval = 0
  private var contentCreated = false
  
  override func didMove(to view: SKView) {
    super.didMove(to: view)
    if !contentCreated{
      onCreateSceneContents()
      contentCreated = true
    }
  }
  
  
  public func onCreateSceneContents(){
    
  }
  
  func touchDown(atPoint pos : CGPoint) {
  }
  
  func touchMoved(toPoint pos : CGPoint) {
  }
  
  func touchUp(atPoint pos : CGPoint) {
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
    
    // Initialize _lastUpdateTime if it has not already been
    if (self.lastUpdateTime == 0) {
      self.lastUpdateTime = currentTime
    }
    
    // Calculate time since last update
    let dt = currentTime - self.lastUpdateTime
    
    // Update entities
    
    self.lastUpdateTime = currentTime
  }
}
