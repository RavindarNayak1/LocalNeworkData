
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nothPrint()
    }
    func nothPrint(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            if NetWorkMannager.Shared.locationCountry.country == "US" {
                self.view.backgroundColor = UIColor.green
                
                
            } else{
                self.view.backgroundColor = UIColor.red
            }
            
            self.nameLabel.text = NetWorkMannager.Shared.locationCountry.region
            
            print(NetWorkMannager.Shared.locationCountry)
        }
        
        
        
    }
    
}
