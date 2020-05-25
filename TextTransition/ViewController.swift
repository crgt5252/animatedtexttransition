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
        
//        let words = ["science", "math", "history", "english", "pandemic gardening", "robotics","dog whispering","diy robots","us colonial history","video games as modern art", "2pac: Lyrical Warrior Poet", "Ethnomusicology", "C++ For C Students", "Love in the Time of Corona", "Compassionate Libertarianism", "A Look at UBI",  "Norse Mythology", "Roman History: The Republic", "Memes as medium"]
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
                      /*
                      0000001223  148914   8.7  Psycho (1960)
        0000000123  275216   8.7  The Usual Suspects (1995)
        0000000123  394719   8.7  The Matrix (1999)
        0000000232  255023   8.6  The Silence of the Lambs (1991)
        0000000232  290808   8.6  Se7en (1995)
        0000000123  285185   8.6  Memento (2000)
        0000000124  104697   8.6  It's a Wonderful Life (1946)
        0000000124  338053   8.6  The Lord of the Rings: The Two Towers (2002)
        0000000123   56773   8.6  Sunset Blvd. (1950)
        0000000123  160145   8.6  Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1964)
        0000000123  313672   8.6  Forrest Gump (1994)
        0000000223  208205   8.6  L�on (1994)
        0000000114  141872   8.6  Citizen Kane (1941)
        0000001123  178597   8.6  Apocalypse Now (1979)
        0000001222   96222   8.6  North by Northwest (1959)
        0000000123  302035   8.6  American Beauty (1999)
        0000000233  234022   8.5  American History X (1998)
        0000001223  161948   8.5  Taxi Driver (1976)
        0000001223  246635   8.5  Terminator 2: Judgment Day (1991)
        0000001223  279154   8.5  Saving Private Ryan (1998)
        0000001223   94706   8.5  Vertigo (1958)
        0000000124  188313   8.5  Le fabuleux destin d'Am�lie Poulain (2001)
        0000001222  186819   8.5  Alien (1979)
        0000000123  191780   8.5  WALL�E (2008)
        0000000123   81773   8.5  Lawrence of Arabia (1962)
        0000001222  184793   8.5  The Shining (1980)
        0000000123  105872   8.5  Sen to Chihiro no kamikakushi (2001)
        0000000223   46470   8.5  Paths of Glory (1957)
        0000000123  199902   8.5  A Clockwork Orange (1971)
        0000001223   38404   8.5  Double Indemnity (1944)
        0000001223   85361   8.5  To Kill a Mockingbird (1962)
        0000000232  140210   8.5  The Pianist (2002)
        0000000233   78799   8.4  Das Leben der Anderen (2006)
        0000000223  274780   8.4  The Departed (2006)
        0000000123   41375   8.4  M (1931)
        0000000124   28818   8.4  City Lights (1931)
        0000001223  175519   8.4  Aliens (1986)
        0000000123  227887   8.4  Eternal Sunshine of the Spotless Mind (2004)
        0000000123  192223   8.4  Requiem for a Dream (2000)
        0000000223   72202   8.4  Das Boot (1981)
        0000001223   52355   8.4  The Third Man (1949)
        0000001222  169731   8.4  L.A. Confidential (1997)
        0000001222  219847   8.4  Reservoir Dogs (1992)
        0000001222   81650   8.4  Chinatown (1974)
        0000001222   34343   8.4  The Treasure of the Sierra Madre (1948)
        0000000223   37289   8.4  Modern Times (1936)
        0000001223  159379   8.4  Monty Python and the Holy Grail (1975)
        0000000123  113324   8.4  La vita � bella (1997)
        0000001223  210668   8.4  Back to the Future (1985)
        0000001222  217670   8.4  The Prestige (2006)
        0000001223  160911   8.4  El laberinto del fauno (2006)
        0000001223   92934   8.4  Raging Bull (1980)
        0000000123   47429   8.3  Nuovo Cinema Paradiso (1988)
        0000001123   57133   8.3  Singin' in the Rain (1952)
        0000001223   69595   8.3  Some Like It Hot (1959)
        0000001222   60541   8.3  The Bridge on the River Kwai (1957)
        0000001123   40408   8.3  Rash�mon (1950)
        0000001223   35913   8.3  All About Eve (1950)
        0000001223  100409   8.3  Amadeus (1984)
        0000001223   74868   8.3  Once Upon a Time in America (1984)
        0000001222  207425   8.3  The Green Mile (1999)
        0000001222  157726   8.3  Full Metal Jacket (1987)
        0000000123  191801   8.3  Inglourious Basterds (2009)
        0000000113  165071   8.3  2001: A Space Odyssey (1968)
        0000001223   38671   8.3  The Great Dictator (1940)
        0000001123  248935   8.3  Braveheart (1995)
        0000001223   28733   8.3  Ladri di biciclette (1948)
        0000001222   37824   8.3  The Apartment (1960)
        0000001223  120533   8.3  Up (2009)
        0000001222   85818   8.3  Der Untergang (2004)
        0000001232  137407   8.3  Gran Torino (2008)
        0000001123   41430   8.3  Metropolis (1927)
        0000001222   68064   8.3  The Sting (1973)
        0000001223  290146   8.3  Gladiator (2000)
        0000001222   52958   8.3  The Maltese Falcon (1941)
        0000001222  102644   8.3  Unforgiven (1992)
        0000000223  264162   8.3  Sin City (2005)
        0000001222   60476   8.3  The Elephant Man (1980)
        0000001223   34376   8.3  Mr. Smith Goes to Washington (1939)
        0000000123  102094   8.3  Oldeuboi (2003)
        0000001222   42517   8.3  On the Waterfront (1954)
        0000001222  177060   8.3  Indiana Jones and the Last Crusade (1989)
        0000001222  217458   8.3  Star Wars: Episode VI - Return of the Jedi (1983)
        0000001222   36521   8.3  Rebecca (1940)
        0000001222   64255   8.3  The Great Escape (1963)
        0000001222  187866   8.3  Die Hard (1988)
        0000001222  279683   8.3  Batman Begins (2005)
        0000000123   68268   8.3  Mononoke-hime (1997)
        0000001222  142797   8.2  Jaws (1975)
        0000001222   95758   8.2  Hotel Rwanda (2004)
        0000001222  185021   8.2  Slumdog Millionaire (2008)
        0000000123   38416   8.2  Det sjunde inseglet (1957)
        0000001123  190702   8.2  Blade Runner (1982)
        0000001222  169907   8.2  Fargo (1996)
        0000001222  205575   8.2  No Country for Old Men (2007)
        0000001222  149989   8.2  Heat (1995)
        0000001223   20766   8.2  The General (1926)
        0000001213  106347   8.2  The Wizard of Oz (1939)
        0000001222   33677   8.2  Touch of Evil (1958)
        0000001222   46480   8.2  Per qualche dollaro in pi� (1965)
        0000001123   35624   8.2  Ran (1985)
        0000000222   30306   8.2  Y�jinb� (1961)
        0000001222  161941   8.2  District 9 (2009)
        0000001222  247298   8.2  The Sixth Sense (1999)
        0000001222  180747   8.2  Snatch. (2000)
        0000001123  217871   8.2  Donnie Darko (2001)
        0000001222   67681   8.2  Annie Hall (1977)
        0000001222   18821   8.2  Witness for the Prosecution (1957)
        0000000223   22194   8.2  Smultronst�llet (1957)
        0000001222   90919   8.2  The Deer Hunter (1978)
        0000000124  277855   8.2  Avatar (2009)
        0000001222   47326   8.2  The Social Network (2010)
        0000001222   47140   8.2  Cool Hand Luke (1967)
        0000001222   35680   8.2  Strangers on a Train (1951)
        0000001222   35233   8.2  High Noon (1952)
        0000001223  184625   8.2  The Big Lebowski (1998)
        0000000124   36374   8.2  Hotaru no haka (1988)
        0000001222  240923   8.2  Kill Bill: Vol. 1 (2003)
        0000001222   25940   8.2  It Happened One Night (1934)
        0000001222  112239   8.2  Platoon (1986)
        0000001223  144014   8.2  The Lion King (1994)
        0000001222  105740   8.2  Into the Wild (2007)
        0000001122  136242   8.2  There Will Be Blood (2007)
        0000001222   32451   8.1  Notorious (1946)
        0000001222  147318   8.1  Million Dollar Baby (2004)
        0000001222  159204   8.1  Toy Story (1995)
        0000001222   59491   8.1  Butch Cassidy and the Sundance Kid (1969)
        0000001113   81772   8.1  Gone with the Wind (1939)
        0000000114   11876   8.1  Sunrise: A Song of Two Humans (1927)
        0000001222   98555   8.1  The Wrestler (2008)
        0000001222   35631   8.1  The Manchurian Candidate (1962)
        0000001222  155744   8.1  Trainspotting (1996)
        0000001222   60684   8.1  Ben-Hur (1959)
        0000001223  157945   8.1  Scarface (1983)
        0000001222   24145   8.1  The Grapes of Wrath (1940)
        0000001222   80707   8.1  The Graduate (1967)
        0000001222   29880   8.1  The Big Sleep (1946)
        0000001222  140817   8.1  Groundhog Day (1993)
        0000001222   97420   8.1  Life of Brian (1979)
        0000001223   21854   8.1  The Gold Rush (1925)
        0000001222  152545   8.1  The Bourne Ultimatum (2007)
        0000001222   63244   8.1  Amores perros (2000)
        0000001222  172419   8.1  Finding Nemo (2003)
        0000001321  186002   8.1  The Terminator (1984)
        0000001222   93230   8.1  Stand by Me (1986)
        0000001223   45835   8.1  How to Train Your Dragon (2010)
        0000001223   17903   8.1  The Best Years of Our Lives (1946)
        0000001222  130959   8.1  Lock, Stock and Two Smoking Barrels (1998)
        0000001222   82127   8.1  The Thing (1982)
        0000001223   15141   8.1  The Kid (1921)
        0000001223  233665   8.1  V for Vendetta (2006)
        0000001222  112789   8.1  Casino (1995)
        0000001221  175458   8.1  Twelve Monkeys (1995)
        0000001321   61925   8.1  Dog Day Afternoon (1975)
        0000001222  138276   8.1  Ratatouille (2007)
        0000001222   21991   8.1  El secreto de sus ojos (2009)
        0000001222   52893   8.1  Gandhi (1982)
        0000001222  141025   8.1  Star Trek (2009)
        0000000124   16828   8.1  Ikiru (1952)
        0000000222   14758   8.1  Le salaire de la peur (1953)
        0000001222   15359   8.1  Les diaboliques (1955)
        0000000114   30856   8.1  8� (1963)
        0000001223  126372   8.1  The Princess Bride (1987)
        0000001222   26562   8.1  The Night of the Hunter (1955)
        0000001222   14866   8.0  Judgment at Nuremberg (1961)
        0000001222  165723   8.0  The Incredibles (2004)
        0000001223   32785   8.0  Tonari no Totoro (1988)
        0000001222   26174   8.0  The Hustler (1961)
        0000001222  156741   8.0  Good Will Hunting (1997)
        0000001321   25600   8.0  The Killing (1956)
        0000001222  103067   8.0  In Bruges (2008)
        0000001222   32128   8.0  The Wild Bunch (1969)
        0000001222   35189   8.0  Network (1976)
        0000001222   32856   8.0  Le scaphandre et le papillon (2007)
        0000001222   34990   8.0  A Streetcar Named Desire (1951)
        0000001223   24899   8.0  Les quatre cents coups (1959)
        0000001223   18440   8.0  La strada (1954)
        0000001222  108099   8.0  The Exorcist (1973)
        0000001222  164526   8.0  Children of Men (2006)
        0000001222   21382   8.0  Stalag 17 (1953)
        0000000123   16367   8.0  Persona (1966)
        0000001223   20577   8.0  Who's Afraid of Virginia Woolf? (1966)
        0000001222   76528   8.0  Ed Wood (1994)
        0000001321   31357   8.0  Dial M for Murder (1954)
        0000000223   14561   8.0  La battaglia di Algeri (1966)
        0000001222   62254   8.0  L�t den r�tte komma in (2008)
        0000001222   22245   8.0  All Quiet on the Western Front (1930)
        0000001222  146222   8.0  Big Fish (2003)
        0000001222  124649   8.0  Magnolia (1999)
        0000001212  101907   8.0  Rocky (1976)
        0000000114   11135   8.0  La passion de Jeanne d'Arc (1928)
        0000001222   13589   8.0  Kind Hearts and Coronets (1949)
        0000000113   14782   8.0  Fanny och Alexander (1982)
        0000001321  124285   8.0  Mystic River (2003)
        0000001222   40002   8.0  Manhattan (1979)
        0000001223   41067   8.0  Barry Lyndon (1975)
        0000001222  190137   8.0  Kill Bill: Vol. 2 (2004)
        0000001222   13910   8.0  Mary and Max (2009)
        0000001222   40708   8.0  Patton (1970)
        0000001222   53106   8.0  Rosemary's Baby (1968)
        0000001213   27432   8.0  Duck Soup (1933)
        0000000222   27491   8.0  Festen (1998)
        0000001222  104681   8.0  Kick-Ass (2010)
        0000001223   25953   8.0  Fa yeung nin wa (2000)
        0000001221   59450   8.0  Letters from Iwo Jima (2006)
        0000001222   32346   8.0  Roman Holiday (1953)
        0000001222  241673   8.0  Pirates of the Caribbean: The Curse of the Black Pearl (2003)
        0000001222   37039   8.0  Mou gaan dou (2002)
        0000001221  163735   8.0  The Truman Show (1998)
        0000001222  176154   8.0  Crash (2004/I)
        0000001222   47196   8.0  Hauru no ugoku shiro (2004)
        0000001222   21224   8.0  His Girl Friday (1940)
        0000001222   30782   8.0  Arsenic and Old Lace (1944)
        0000001222   24043   8.0  Harvey (1950)
        0000000123   11438   8.0  Le notti di Cabiria (1957)
        0000001222   24669   8.0  Trois couleurs: Rouge (1994)
        0000001223   28439   8.0  The Philadelphia Story (1940)
        0000001213   53043   8.0  A Christmas Story (1983)
        0000001222   18122   8.0  Sleuth (1972)
        0000001212   40569   8.0  King Kong (1933)
        0000001222   18650   8.0  Bom yeoreum gaeul gyeoul geurigo bom (2003)
        0000001321   32836   8.0  Rope (1948)
        0000001321  122533   8.0  Monsters, Inc. (2001)
        0000001222   22030   8.0  Tenk� no shiro Rapyuta (1986)
        0000000124   14334   8.0  Yeopgijeogin geunyeo (2001)
        0000001123  107490   8.0  Mulholland Dr. (2001)
        0000001222   23151   8.0  The Man Who Shot Liberty Valance (1962)
     
     */
        
    }
}
