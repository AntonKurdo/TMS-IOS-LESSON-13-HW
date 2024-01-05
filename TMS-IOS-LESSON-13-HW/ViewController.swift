import UIKit

class ViewController: UIViewController {
    
    let progLangs = ["JavaScript", "Swift", "Kotlin", "Java", "Ruby", "Go", ".Net", "C++", "C#", "Objective-C"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 1) {
            return "Programming languages"
        }
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return 20
        }
        if(section == 1) {
            return progLangs.count
        }
        if(section == 2) {
            return 20
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0) {
            let cell = UITableViewCell()
            cell.backgroundColor = .white
            cell.textLabel!.text = String(indexPath.row)
            cell.textLabel!.textColor = .black
            
            return cell
        }
        
        if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            let lang = progLangs[indexPath.row]
            cell.configure(labelOneText: String(indexPath.row + 1), labelTwoText: lang)
            return cell
        }
        
        if(indexPath.section == 2) {
            let borderRow = 10
            if(indexPath.row < borderRow) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
          
                cell.configure(labelOneText: "Row - \(String(indexPath.row))" , labelTwoText: "Section - \(String(indexPath.section))")
                return cell

            } else {
                let cell = UITableViewCell()
                cell.backgroundColor = .white
                cell.textLabel!.text = progLangs[indexPath.row - borderRow]
                cell.textLabel!.textColor = .black
                
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

