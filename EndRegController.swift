import UIKit

class EndRegController: UIViewController {
    
    @IBAction func buttonGo(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccountStoryboard") as! AccountController
        vc.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
