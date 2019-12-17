//import UIKit
//import RealmSwift
//
//class BookmarksController: UICollectionViewController {
//    
//    var items = [AutoOne]()
//    var realmItems: Results<AutoOne>!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let realm = try! Realm()
//        self.realmItems = realm.objects(AutoOne.self)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return realmItems.isEmpty ? 1 : realmItems.count
//
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        if realmItems.isEmpty {
////            let cell = UICollectionViewCell(style: .default, reuseIdentifier: "")
////            cell.textLabel?.text = "У вас нет сохраненных объявлений."
////            cell.textLabel?.textAlignment = .center
////            cell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
////            cell.textLabel?.textColor = .systemGray3
////            return cell
////        }
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookmarksControllerCell", for: indexPath as IndexPath) as! BookmarksControllerCell
//        //cell.setup(with: realmItems[indexPath.row])
//        cell.labelBrandModelYear.text = realmItems[indexPath.item].autoBrand! + " " + realmItems[indexPath.item].autoModel! + ", " + realmItems[indexPath.item].autoYear!
//        cell.labelPrice.text = realmItems[indexPath.item].autoPrice
//        cell.labelTown.text = realmItems[indexPath.item].autoTown
//        cell.labelMileage.text = realmItems[indexPath.item].autoMileage
//        cell.labelEngine.text = realmItems[indexPath.item].autoEngineVolume! + "/" + realmItems[indexPath.item].autoEnginePower! + "/" + realmItems[indexPath.item].autoEngineType!
//        cell.labelTransmission.text = realmItems[indexPath.item].autoTransmission
//        cell.labelColor.text = realmItems[indexPath.item].autoColor
//        cell.labelDrive.text = realmItems[indexPath.item].autoDrive
//        cell.labelBody.text = realmItems[indexPath.item].autoBody
//        cell.layer.borderColor = UIColor.blue.cgColor
//        cell.layer.borderWidth = 2
////        cell.fButton.onTap {
////            let realm = try! Realm()
////            try! realm.write {
////                realm.add(self.ann[indexPath.row])
////            }
////            self.alert = UIAlertController(title: "Готово!", message: "Вы добавили эту новость в закладки!", preferredStyle: .alert)
////            self.alert.addAction(UIAlertAction(title: "ОК", style: .cancel))
////            self.present(self.alert, animated: true, completion: nil)
////            self.collectionView.reloadData()
////        }
//        return cell
//    }
//    
//    
//    
//    
//    
//    //    @IBOutlet weak var labelBrandModelYear: UILabel!
//    //    @IBOutlet weak var labelPrice: UILabel!
//    //    @IBOutlet weak var labelTown: UILabel!
//    //    @IBOutlet weak var labelMileage: UILabel!
//    //    @IBOutlet weak var labelEngine: UILabel!
//    //    @IBOutlet weak var labelTransmission: UILabel!
//    //    @IBOutlet weak var labelColor: UILabel!
//    //    @IBOutlet weak var labelDrive: UILabel!
//    //    @IBOutlet weak var labelBody: UILabel!
//    //    @IBOutlet weak var labelDate: UILabel!
//    //    @IBOutlet weak var collectionView: UICollectionView!
//    
//}
//
//extension UIImageView {
//    
//    func dddownloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { () -> Void in
//                self.image = image
//            }
//        }.resume()
//    }
//    func dddownloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//        guard let url = URL(string: link) else { return }
//        dddownloadedFrom(url: url, contentMode: mode)
//    }
//}
