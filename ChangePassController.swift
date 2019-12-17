import UIKit
import Firebase

class ChangePassController: UIViewController {
    
    @IBOutlet weak var textFieldPass1: UITextField!
    @IBOutlet weak var textFieldPass2: UITextField!
    @IBOutlet weak var labelText1: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    @IBOutlet weak var labelText3: UILabel!
    
    @IBAction func buttonChange(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccountStoryboard") as! AccountController
        let pass1 = textFieldPass1.text
        let pass2 = textFieldPass2.text
        Auth.auth().currentUser?.updatePassword(to: pass1!) { error in
            if error != nil {
                if pass1 == pass2 && pass1 != "" && pass2 != "" {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Пароль слишком короткий! Длина пароля должна быть не менее 6 знаков."
                }
                if (pass1 != "" && pass2 != "") && (pass1 != pass2) {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Ваши пароли не совпадают."
                }
                if (pass1 == "" && pass2 != "") || (pass1 != "" && pass2 == "") {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Вы не повторили свой пароль."
                }
                if pass1 == "" && pass2 == "" {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Вы ничего не ввели."
                }
            }
            if error == nil {
                vc.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
