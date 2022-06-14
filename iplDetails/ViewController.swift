//
//  ViewController.swift
//  iplDetails
//
//  Created by Abhay Kmar on 20/04/22.
//

import UIKit
class Player {
    var name : String
    var isSelected:Bool
    init(name:String, isSelected:Bool){
        self.isSelected = isSelected
        self.name = name
    }
}
class IplTeam{
    var team:String?
    var isMark:Bool = true
    var players:[Player]?
    init(team:String,isMark:Bool,players:[Player]){
        self.team = team
        self.players = players
        self.isMark = isMark
    }
}
class ViewController: UIViewController,Action {
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "Maximum player selection has been already reached. Please deselect a player and then continue the selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")

                case .cancel:
                print("cancel")

                case .destructive:
                print("destructive")

            @unknown default:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func handelAction(indexPath: IndexPath) {
        let iplTeam = iplTeamArray[indexPath.section] //it will give name of team in - iplTeam
        var totlaPlayerSelected = 0
        guard let players = iplTeam.players else{
            return
        }
        for player in players {
            if(player.isSelected == true) {
                totlaPlayerSelected += 1
            }
        }
        if(totlaPlayerSelected >= 3 && players[indexPath.row].isSelected == false) {
            //show alert message and return
            self.showAlert()
            return
        }
        iplTeamArray[indexPath.section].players?[indexPath.row].isSelected = !(iplTeamArray[indexPath.section].players?[indexPath.row].isSelected ?? false)
        self.iplTable.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @IBOutlet weak var iplTable: UITableView!
    var iplTeamArray = [IplTeam]()
    override func viewDidLoad() {
        super.viewDidLoad()
        iplData()
    }
    func iplData(){
        iplTeamArray.append(IplTeam.init(team: "Mumbai Indians", isMark: false, players: [  Player(name: "Rohit Sharma", isSelected: false),Player(name: "ANMOLPREETSINGH", isSelected: false),Player(name: "ARJUN TENDULKAR", isSelected: false),Player(name: "ARSHAD KHAN", isSelected: false),Player(name: "ARYAN JUYAL", isSelected: false)]))
                                                                                            
        iplTeamArray.append(IplTeam.init(team: "Channai Super King", isMark: false, players: [  Player(name: "Uthappa", isSelected: false),Player(name: "Faf du Plessis", isSelected: false),Player(name: "Ambati Rayudu", isSelected: false),Player(name: "Dwayne Bravo", isSelected: false),Player(name: "Shardul Thakur", isSelected: false)]))
        
        iplTeamArray.append(IplTeam.init(team: "Sunrisers Hyderabad", isMark: false, players: [  Player(name: "Washington Sundar", isSelected: false),Player(name: "Nicholas", isSelected: false),Player(name: "PooranT Natarajan", isSelected: false),Player(name: "Bhuvneshwar Kumar", isSelected: false),Player(name: "Priyam Garg", isSelected: false)]))
        
        iplTeamArray.append(IplTeam.init(team: "RCB", isMark: false, players: [  Player(name: "Virat Kohli", isSelected: false),Player(name: "Glenn Maxwell", isSelected: false),Player(name: "Mohammad Siraj", isSelected: false),Player(name: "Dinesh Karthik", isSelected: false),Player(name: "Josh", isSelected: false)]))

        iplTeamArray.append(IplTeam.init(team: "Kolkata Knight Riders", isMark: false, players: [  Player(name: "Andre Russell", isSelected: false),Player(name: "Varun Chakravarty", isSelected: false),Player(name: "Varun Chakravarty", isSelected: false),Player(name: "Venkatesh Iyer", isSelected: false),Player(name: "Sunil Narine", isSelected: false)]))

    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iplTeamArray[section].players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IplTableViewCell
        let iplTeam = iplTeamArray[indexPath.section]
        if let players = iplTeam.players {
            cell.updateCell(isMark: players[indexPath.row].isSelected, name: players[indexPath.row].name)
            cell.delegate = self
            cell.indexPath = indexPath
            return cell
        }
        else {
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return iplTeamArray[section].team

    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.blue
//        let lable = UILabel()
//        lable.text =  iplTeamArray[section].team
//        return view
//    }
}
extension ViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        iplTeamArray.count
    }
}


