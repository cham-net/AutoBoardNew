import UIKit
import Firebase

class RegController: UIViewController {
    
    @IBOutlet weak var textFieldMail: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var textFieldPassReplay: UITextField!
    @IBOutlet weak var labelText1: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    @IBOutlet weak var labelText3: UILabel!
    
    @IBAction func buttonGo(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EndRegStoryboard") as! EndRegController
        let email = textFieldMail.text
        let password = textFieldPass.text
        let passwordReplay = textFieldPassReplay.text
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            if error != nil {
                if password != passwordReplay {
                        self.labelText1.text = "Упс!"
                        self.labelText2.text = "Что-то пошло не так!"
                        self.labelText3.text = "Ваши пароли не совпадают."
                    }
                if password == "" && passwordReplay == "" {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Вы не до конца ввели информацию."
                }
                if password == "" && passwordReplay == "" && email == "" {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Вы ничего не ввели."
                }
                if email == "" && password != "" && passwordReplay != ""{
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Вы не ввели почтовый адрес."
                }
                if password != "" && password != "" && password == passwordReplay {
                    self.labelText1.text = "Упс!"
                    self.labelText2.text = "Что-то пошло не так!"
                    self.labelText3.text = "Проверьте, правильно ли Вы вводите адрес электронной почты."
                }
            }
            if error == nil {
                vc.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
