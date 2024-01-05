import UIKit

class TableViewCell: UITableViewCell {
    
    let screenSize = UIScreen.main.bounds
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
   
        return view
    }()
    
    var labelOne: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        return label
    }()
    
    var labelTwo: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 60)
        
        view.addSubview(labelOne)
        labelOne.frame = CGRect(x: 20, y: 25, width: 100, height: 20)
        
        view.addSubview(labelTwo)
        labelTwo.frame = CGRect(x: 130, y: 25, width: 100, height: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected) {
            view.backgroundColor = .red
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.3) {
                    self.view.backgroundColor = .white
                }
                super.setSelected(false, animated: animated)
            }
        } else {
            view.backgroundColor = .white
        }
    }
    
    func configure(labelOneText: String, labelTwoText: String) {
        labelOne.text = labelOneText
        labelTwo.text = labelTwoText
    }
}
