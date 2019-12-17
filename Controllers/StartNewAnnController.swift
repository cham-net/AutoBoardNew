import UIKit

class StartNewAnnController: UIViewController {
    
    @IBAction func buttonStartNewAnn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewAnnStoryboard") as! NewAnnController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
