//
//  AnimatedTextChangeLabel.swift
//  TextTransition
//
//  Created by Christopher Taylor on 5/24/20.
//  Copyright © 2020 Christopher Taylor. All rights reserved.
//

import UIKit

class AnimatedTextChangeLabel: Any {}

extension UILabel {
        
    func transitionToText(_ targetText: String, _ duration: Double = 1.0, _ ticksSoFar: Int = 0, _ ticksSinceLetterChange: Int = 0, _ ticksSinceDeltaChange: Int = 0, _ ticksPerDelta: Int = -1) {
        self.isUserInteractionEnabled = false
        let tickTock = 0.01
        let fromText = self.text ?? ""
        var curr = Array(fromText)
        let targetArr = Array(targetText)
        
        let alpha = Array("abcdefghijklmnopqrstuvwzyz")
        var ticksSoFar = ticksSoFar
        var ticksSinceLetterChange = ticksSinceLetterChange
        var ticksSinceDeltaChange = ticksSinceDeltaChange
        var ticksPerDelta = ticksPerDelta
        
        var totalTicks = 0
        while (tickTock * Double(totalTicks) <= duration) { totalTicks += 1 }
        var ticksPerLetter = totalTicks / targetText.count
        if ticksPerLetter == 0 { print("totalTicks \(totalTicks)"); ticksPerLetter = 1 }
        
        let remDelta = abs(curr.count - targetArr.count)
        if ticksPerDelta == -1 && remDelta != 0 {
            ticksPerDelta = totalTicks / remDelta; print("total: \(totalTicks) tpl: \(ticksPerLetter) tpd: \(ticksPerDelta)")
            if ticksPerDelta > 1 { ticksPerDelta /= 2 }
        }
        
        
        if ticksSoFar <= totalTicks  {
            ticksSoFar += 1
            var updated: [Character] = curr
            // lock the correct letters into place when enough ticks have occured
            for (i, _) in curr.enumerated() {
                if i * ticksPerLetter <= ticksSoFar {
                    if i < targetArr.count { updated[i] = targetArr[i] }
                }
                else {
                    let ridx = Int.random(in: 0..<25)
                    updated[i] = alpha[ridx]
                }
            }
            ticksSinceLetterChange += 1
        
            // correct the delta in letter count if needed
            if ticksSinceDeltaChange >= ticksPerDelta && ticksPerDelta != -1 {
                ticksSinceDeltaChange = 0
                if curr.count > targetArr.count {
                    updated.removeLast()
                }
                else if curr.count < targetArr.count {
                    let ridx = Int.random(in: 0..<25)
                    updated.append(alpha[ridx])
                }
            }
            ticksSinceDeltaChange += 1
            curr = updated
            self.text = String(updated)
            self.layoutSubviews()

            var args: [String: Any] = [:]
            args["target"] = targetText
            args["duration"] = duration
            args["ticksSoFar"]  = ticksSoFar
            args["sinceLetterChange"]  = ticksSinceLetterChange
            args["ticksSinceDeltaChange"]  = ticksSinceDeltaChange
            args["ticksPerDelta"]  = ticksPerDelta
            self.perform(#selector(textTickTock(_:)), with: args, afterDelay: tickTock)
        } else {
            print("finish")
            self.text = targetText
            self.isUserInteractionEnabled = true
        }
    }
    

    @objc fileprivate func textTickTock(_ args: [String: Any]) {
        guard args["target"] != nil else { return }
        guard args["duration"] != nil else { return }
        guard args["ticksSoFar"] != nil else { return }
        guard args["sinceLetterChange"] != nil else { return }
        guard args["ticksSinceDeltaChange"] != nil else { return }
        guard args["ticksPerDelta"] != nil else { return }
        
        guard let targetText = args["target"] as? String else { return }
        guard let duration = args["duration"] as? Double else { return }
        guard let ticksSoFar = args["ticksSoFar"] as? Int else { return }
        guard let ticksSinceLetterChange = args["sinceLetterChange"] as? Int else { return }
        guard let ticksSinceDeltaChange = args["ticksSinceDeltaChange"] as? Int else { return }
        guard let ticksPerDelta = args["ticksPerDelta"] as? Int else { return }
        self.transitionToText(targetText, duration, ticksSoFar, ticksSinceLetterChange, ticksSinceDeltaChange, ticksPerDelta)
    }
    
}
