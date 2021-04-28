//
//  ViewController.swift
//  Conan
//
//  Created by Monica Lo on 2021/4/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var wheelsDatePicker: UIDatePicker!
    @IBOutlet weak var sSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    
    
    
    
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var imageNumber = 0
    var sliderNumber = 0
    
    let image = [ 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let gifImageView = UIImageView(frame: CGRect(x: 41, y: 391, width: 240, height: 164))
        gifImageView.alpha = 0.3
        view.addSubview(gifImageView)
        
        let animatedImage = UIImage.animatedImageNamed("c0ab8a83c88542d0a05fa6631884845erY4xYqsyHAeGGRWl-", duration: 3)
               gifImageView.image = animatedImage
        
        slider.setThumbImage(UIImage(named: "skateboard"), for: .normal)
        slider.setThumbImage(UIImage(named: "skateboard"), for: .highlighted)

        dateFormatter.dateFormat = "yyyy/MM/dd"
}
    func chooseImage(num1 : Int){
    switch num1 {
    case 0:dateString = "1997/04/19"
    case 1:dateString = "1998/04/18"
    case 2:dateString = "1999/04/17"
    case 3:dateString = "2000/04/22"
    case 4:dateString = "2001/04/21"
    case 5:dateString = "2002/04/20"
    case 6:dateString = "2003/04/19"
    case 7:dateString = "2004/04/17"
    case 8:dateString = "2005/04/09"
    case 9:dateString = "2006/04/15"
    case 10:dateString = "2007/04/21"
    case 11:dateString = "2008/04/19"
    case 12:dateString = "2009/04/18"
    case 13:dateString = "2010/04/17"
    case 14:dateString = "2011/04/16"
    case 15:dateString = "2012/04/14"
    case 16:dateString = "2013/04/20"
    case 17:dateString = "2014/04/19"
    case 18:dateString = "2015/04/18"
    case 19:dateString = "2016/04/16"
    case 20:dateString = "2017/04/15"
    case 21:dateString = "2018/04/13"
    case 22:dateString = "2019/04/12"
    case 23:dateString = "2020/01/05"
    case 24:dateString = "2021/04/16"
    default:dateString = "1997/04/19"
    }
        let date = dateFormatter.date(from: dateString)
        wheelsDatePicker.date = date!
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: wheelsDatePicker.date)
        let year = dateComponents.year!
            yearLabel.text = "\(year)"
        }

        func time () {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
        self.compare()})
        }
           
        func compare () {
                if imageNumber >= image.count {
                    imageNumber = 0
                    chooseImage(num1: imageNumber)
                    posterImageView.image = UIImage(named: String(image[imageNumber]))
                } else {
                    chooseImage(num1: imageNumber)
                    posterImageView.image = UIImage(named: String(image[imageNumber]))
                }
                slider.value = Float(imageNumber)
                imageNumber += 1
        }
    
    @IBAction func yearChange(_ sender: UIDatePicker) {
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: wheelsDatePicker.date)
        let year = dateComponents.year!
        let imageName = "\(year)"
        posterImageView.image = UIImage(named: imageName)
        slider.value = Float(year - 1997)
        yearLabel.text = "\(year)"
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        let sliderNumber = Int(sender.value)
        let newDate = DateComponents(calendar: Calendar.current, year: image[sliderNumber]).date
        wheelsDatePicker.date = newDate!
        yearLabel.text = String(image[sliderNumber])
        posterImageView.image = UIImage(named: String(image[sliderNumber]))
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
        if sender.isOn {
           time()
        }else {
           timer?.invalidate()
        }

    }
    
}
