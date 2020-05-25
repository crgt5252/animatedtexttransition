//
//  ViewController.swift
//  TextTransition
//
//  Created by Christopher Taylor on 5/24/20.
//  Copyright © 2020 Christopher Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sampleLabel = UILabel.init()
    var prevIdx = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // any label will do
        sampleLabel.frame = CGRect.init(x: 10, y: self.view.bounds.size.height / 2 - 25, width: self.view.bounds.size.width - 20, height: 50)
        sampleLabel.text = "learning"
        sampleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        sampleLabel.textAlignment = .left
        sampleLabel.isUserInteractionEnabled = true
        self.view.addSubview(sampleLabel)
        
        sampleLabel.transitionToText("Movie Titles")
        let tapGR = UITapGestureRecognizer.init(target: self, action: #selector(randomTransition))
        self.view.addGestureRecognizer(tapGR)
        
    }
    
    @objc func randomTransition() {
        
        let words = getMovieTitles()
        let ridx = Int.random(in: 0..<words.count)
        guard ridx != prevIdx else { randomTransition(); return }
        sampleLabel.transitionToText(words[ridx])
        prevIdx = ridx
        
    }
    
    func getMovieTitles() -> [String] {
        
        let movies = ["The Shawshank Redemption (1994)",
                      "The Godfather (1972)",
                      "The Godfather: Part II (1974)",
                      "Pulp Fiction (1994)",
                      "Inception (2010)",
                      "Schindler's List (1993)",
                      "12 Angry Men (1957)",
                      "One Flew Over the Cuckoo's Nest (1975)",
                      "The Dark Knight (2008)",
                      "Star Wars: Episode V - The Empire Strikes Back (1980)",
                      "The Lord of the Rings: The Return of the King (2003)",
                      "Shichinin no samurai (1954)",
                      "Star Wars (1977)",
                      "Goodfellas (1990)",
                      "Casablanca (1942)",
                      "Fight Club (1999)",
                      "Cidade de Deus (2002)",
                      "The Lord of the Rings: The Fellowship of the Ring (2001)",
                      "Rear Window (1954)",
                      "C'era una volta il West (1968)",
                      "Raiders of the Lost Ark (1981)",
                      "Toy Story 3 (2010)"]
        return movies        
    }
}
