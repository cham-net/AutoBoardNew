import UIKit
import Firebase

class InputMainController: UIViewController {
    
    @IBAction func buttonReg(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegStoryboard") as! RegController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginStoryboard") as! LoginController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
