
import Foundation
import UIKit

struct TimeSlider {
    var sliderProgress:Int
    var timeInSeconds:Int

    mutating func updateConsideringTotalTime(total:Int){
        timeInSeconds = total * sliderProgress
    }
}

class SliderTableViewController: UITableViewController {

    @IBOutlet var totalTime: UITextField!
    var sliders = [TimeSlider]()
    var totalSeconds = 0
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!SliderTableViewCell
        
        let tSlider = sliders[indexPath.section]
        cell.timeSlider.setValue(Float(tSlider.sliderProgress), animated: true)

        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sliders.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func addSliderButtonPressed(sender: UIButton) {
        let newSlider = TimeSlider(sliderProgress: 0, timeInSeconds: totalSeconds)
        
        sliders.append(newSlider)
        tableView.reloadData()
    }
    
    func secondsLeftToSpend() -> Int {
       return sliders.reduce(0) { $0 + $1.timeInSeconds }
    }
    
}