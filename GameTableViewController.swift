//
//  GameTableViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {

    @IBOutlet var GameTableView: UITableView!

    var games = [GameInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parcer = JsonParcer()
        parcer.parceFromFile(forParce: &games, fileName: "games")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: DescViewController = segue.destination as! DescViewController
        
        let cell = sender as! GameTableViewCell
        
        viewController.gameInfo.name = cell.LabelGame.text!
        viewController.gameInfo.image = cell.imageGame.image!
        viewController.gameInfo.desc = cell.LabelDescription.text!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        
        cell.imageGame.image = games[indexPath.row].image
        cell.LabelGame.text = games[indexPath.row].name
        cell.LabelDescription.text = games[indexPath.row].desc
        
        return cell
    }
}
