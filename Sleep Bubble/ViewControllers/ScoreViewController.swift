//
//  ScoreViewController.swift
//  Sleep Bubble
//
//  Created by Yuan Li on 16/4/21.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var scoreRecord:[String:Int] = [:]
    var scoreRank:[String:Int] = [:]
    var highScoreRecord: [(key: String, value: Int)] = []
    
    @IBOutlet weak var highScoreTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get data from gameViewController
        if let item = UserDefaults.standard.value(forKey:"scoreRecord") as? [String:Int] {
            self.scoreRecord = item
        }
        
        let nib = UINib(nibName:"HighScoreTableViewCell", bundle: nil)
        highScoreTableView.register(nib, forCellReuseIdentifier: "HighScoreTableViewCell")
        
        //update scoreRecord to highScoreRecord
        highScoreRecord += scoreRecord
        
        highScoreTableView.delegate = self
        highScoreTableView.dataSource = self
        
        MusicPlayer.shared.stopBackgroundMusic()
    }
}


extension ScoreViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped a record.")
    }
}

//rank socreRecord array by the value of points and create new array HighScoreRecord, and show top ten record on the table view/table view cells.
extension ScoreViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreTableViewCell", for: indexPath) as! HighScoreTableViewCell
        
        //rank scoreRecord array by players' points, and generate the ordered array to a new array: highScoreRecord.
        let highScoreRecord = scoreRecord.sorted(by: {$0.value > $1.value})
        
        //print highScoreArray from the highest to lower.
        cell.nameLabel.text = highScoreRecord[indexPath.row].key
        cell.scoreLabel.text = String(highScoreRecord[indexPath.row].value)
        
        return cell
    }
    
    //only show top 10 high scores.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //   highScoreRecord.count
        var i: Int
        if highScoreRecord.count <= 10{
            i = highScoreRecord.count
        } else {
            i = 10
        }
        return i
    }
}
