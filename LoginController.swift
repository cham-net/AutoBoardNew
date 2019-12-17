import UIKit
import Firebase

class LoginController: UIViewController {
    
    @IBOutlet weak var textFieldMail: UITextField!
    @IBOutlet weak var textFieldPass: UITextField!
    @IBOutlet weak var labelText1: UILabel!
    @IBOutlet weak var labelText2: UILabel!
    @IBOutlet weak var labelText3: UILabel!
    
    @IBAction func buttonGo(_ sender: Any) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AccountStoryboard") as! AccountController
            let email = textFieldMail.text
            let password = textFieldPass.text
            Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
                if error != nil {
                  if email == "" && password == "" {
                      self.labelText1.text = "Упс!"
                      self.labelText2.text = "Что-то пошло не так!"
                      self.labelText3.text = "Вы ничего не ввели."
                  }
                  if email != "" && password == "" {
                      self.labelText1.text = "Упс!"
                      self.labelText2.text = "Что-то пошло не так!"
                      self.labelText3.text = "Вы не ввели пароль."
                  }
                  if email == "" && password != "" {
                      self.labelText1.text = "Упс!"
                      self.labelText2.text = "Что-то пошло не так!"
                      self.labelText3.text = "Вы ничего адрес электронной почты."
                  }
                  if email != "" && password != "" {
                      self.labelText1.text = "Упс!"
                      self.labelText2.text = "Что-то пошло не так!"
                      self.labelText3.text = "Проверьте, правильно ли вы вводите пароль или адрес электронной почты."
                  }
                }
                if error == nil {
                  vc.navigationItem.hidesBackButton = true
                  self.navigationController?.pushViewController(vc, animated: true)
                }
           }
    }
    
}
