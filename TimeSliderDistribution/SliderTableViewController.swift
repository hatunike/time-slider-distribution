
import Foundation
import UIKit

struct TimeSlider {
    var sliderProgress:Float
    var timeInSeconds:Int

    mutating func updateConsideringTotalTime(total:Int){
        timeInSeconds = total * Int(sliderProgress)
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
        cell.timeSlider.tag = indexPath.row
        cell.timeSlider.addTarget(self, action: "sliderChanged:", forControlEvents: .ValueChanged)
        cell.timeSlider.maximumValue = (1.0 - totalProgress())
        return cell
    }
    
    func sliderChanged(slider:UISlider) {
        slider.maximumValue = (1.0 - totalProgress())
        var tSlider = sliders[slider.tag]
        tSlider.sliderProgress = slider.value
        tSlider.updateConsideringTotalTime(totalSeconds)
        print("slider changed to \(slider.value) at row \(tSlider.sliderProgress)")

        sliders[slider.tag] = tSlider
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
    
    func totalProgress() -> Float {
        return sliders.reduce(0) { $0 + $1.sliderProgress }
    }
    
}