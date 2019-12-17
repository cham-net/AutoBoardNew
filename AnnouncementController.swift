import UIKit
import Closures
import RealmSwift

class AnnouncementController: UICollectionViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
        var image: UIImage?
    
        private var ann = [AutoOne]() {
          didSet {
              collectionView.reloadData()
          }
        }
    
//        var realmItems: Results<AutoOne>!
    
        var alert: UIAlertController!
        var addAction: UIAlertAction!
        
        override func viewDidLoad() {
            super.viewDidLoad()
//            let autoBrand = "BMW"
//            let autoModel = "X5"
//            let autoYear = "2014"
//            let autoBody = "Внедорожник"
//            let autoEngineType = "Бензин"
//            let autoEngineVolume = "1.8 л."
//            let autoEnginePower = "140 л.с."
//            let autoTransmission = "Автоматическая"
//            let autoDrive = "Передний"
//            let autoColor = "Серый"
//            let autoMileage = "220 000 км."
//            let autoRegion = "Челябинская область"
//            let autoTown = "Миасс"
//            let contactName = "Степан"
//            let contactPhone = "+74585673344"
//            let autoPrice = "700 000"
//            let autoInfo = "Тест тест тест."
//            let autoPhoto = [
//                "https://avatars.mds.yandex.net/get-autoru-vos/2154462/ec1ac5eb692b09f1a624f2a114df3615/1200x900n",
//                "https://avatars.mds.yandex.net/get-autoru-vos/1650647/bfa4ec46843e6dd001b13eaca4131303/1200x900n",
//                "https://avatars.mds.yandex.net/get-autoru-vos/1650647/bfa4ec46843e6dd001b13eaca4131303/1200x900n",
//                "https://avatars.mds.yandex.net/get-autoru-vos/1650647/bfa4ec46843e6dd001b13eaca4131303/1200x900n"
//                ]
//            API.createAnn(autoBrand: autoBrand, autoModel: autoModel, autoYear: autoYear, autoBody: autoBody, autoEngineType: autoEngineType, autoEngineVolume: autoEngineVolume, autoEnginePower: autoEnginePower, autoTransmission: autoTransmission, autoDrive: autoDrive, autoColor: autoColor, autoMileage: autoMileage, autoRegion: autoRegion, autoTown: autoTown, contactName: contactName, contactPhone: contactPhone, autoPrice: autoPrice, autoInfo: autoInfo, autoPhoto: autoPhoto) {
//                result in guard result else { return }
//            }
            activityIndicator.startAnimating()
            API.loadAnn { annArray in
                self.ann = annArray
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        }
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            ann.count

        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnouncementControllerCell", for: indexPath as IndexPath) as! AnnouncementControllerCell
            cell.setup(with: ann[indexPath.row])
            cell.labelBrandModelYear.text = ann[indexPath.item].autoBrand! + " " + ann[indexPath.item].autoModel! + ", " + ann[indexPath.item].autoYear!
            cell.labelPrice.text = ann[indexPath.item].autoPrice
            cell.labelTown.text = ann[indexPath.item].autoTown
            cell.labelMileage.text = ann[indexPath.item].autoMileage
            cell.labelEngine.text = ann[indexPath.item].autoEngineVolume! + "/" + ann[indexPath.item].autoEnginePower! + "/" + ann[indexPath.item].autoEngineType!
            cell.labelTransmission.text = ann[indexPath.item].autoTransmission
            cell.labelColor.text = ann[indexPath.item].autoColor
            cell.labelDrive.text = ann[indexPath.item].autoDrive
            cell.labelBody.text = ann[indexPath.item].autoBody
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.borderWidth = 2
//            cell.fButton.onTap {
//                let realm = try! Realm()
//                try! realm.write {
//                    realm.add(self.ann[indexPath.row])
//                }
//                self.alert = UIAlertController(title: "Готово!", message: "Вы добавили эту новость в закладки!", preferredStyle: .alert)
//                self.alert.addAction(UIAlertAction(title: "ОК", style: .cancel))
//                self.present(self.alert, animated: true, completion: nil)
//                self.collectionView.reloadData()
//            }
            return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnnouncementDetailStoryboard") as! AnnouncementDetailController
            //_ = vc.view
            vc.loadViewIfNeeded()
            vc.labelBrandModel.text = ann[indexPath.item].autoBrand! + " " + ann[indexPath.item].autoModel!
            vc.labelPrice.text = ann[indexPath.item].autoPrice
            vc.labelTown.text = ann[indexPath.item].autoTown
            vc.labelYear.text = ann[indexPath.item].autoYear
            vc.labelMileage.text = ann[indexPath.item].autoMileage
            vc.labelBody.text = ann[indexPath.item].autoBody
            vc.labelColor.text = ann[indexPath.item].autoColor
            vc.labelEngine.text = ann[indexPath.item].autoEngineVolume! + "/" + ann[indexPath.item].autoEnginePower! + "/" + ann[indexPath.item].autoEngineType!
            vc.labelTransmission.text = ann[indexPath.item].autoTransmission
            vc.labelDrive.text = ann[indexPath.item].autoDrive
            vc.labelContactName.text = ann[indexPath.item].contactName
            vc.labelContactPhone.text = ann[indexPath.item].contactPhone
            vc.labelInfo.text = ann[indexPath.item].autoInfo
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    
}
