import UIKit
import Firebase

class AccountController: UIViewController {
    
    @IBOutlet weak var labelMail: UILabel!
    @IBAction func buttonExit(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InputMainStoryboard") as! InputMainController
            vc.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(vc, animated: true)
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBAction func buttonDark(_ sender: Any) {
        if stateSwitch.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            stateSwitch.setOn(true, animated:true)
        } else {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
            stateSwitch.setOn(false, animated:true)
        }
    }
    @IBAction func buttonAnn(_ sender: Any) {
    }
    @IBAction func buttonChange(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePassStoryboard") as! ChangePassController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
