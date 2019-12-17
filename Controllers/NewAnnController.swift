import UIKit
import Photos

class NewAnnController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagesArray : [UIImage] = []
    
    @IBOutlet weak var cameraRollCollectionView: UICollectionView!
    
    @IBAction func downloadPhoto(_ sender: Any) {
        let picker:UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
        print("1111")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedimage = (info[.originalImage] as? UIImage){
            imagesArray = [pickedimage]
        }
        cameraRollCollectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        print("2222")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
        //return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageNewAnnCell", for: indexPath as IndexPath) as! ImageNewAnnCell
        //cell.imageCell.image = UIImage(named: "Audi")
        cell.configurecell(image: imagesArray[indexPath.row])
        return cell
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showVc(from indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsAnnStoryboard") as! DetailsAnnController
        switch indexPath {
        case [0, 0]:
            print("00")
        case [1, 0]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 1]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 2]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 3]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 4]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 5]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 6]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 7]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 8]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [1, 9]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [2, 0]:
            self.navigationController?.pushViewController(vc, animated: true)
        case [2, 1]:
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showVc(from: indexPath)
    }
    
}
