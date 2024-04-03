
import Foundation
import SwiftUI

class BookingViewModel : ObservableObject {
    
    @Published
    var isDateSelected: Bool = false
    @Published
    var isTimeSelected: Bool = false
    
    struct DateData {
        var weekDay: String
        var numDay: String
        var isSelected: Bool
        var width: CGFloat
        var height: CGFloat
        var action: () -> Void
    }
    
    struct TimeData {
        var hour: String
        var isSelected : Bool
        var width: CGFloat
        var height: CGFloat
        var action: () -> Void
    }
    
    
    @Published 
    var dates: [DateData] = [
           DateData(weekDay: "Pon", numDay: "20", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Uto", numDay: "21", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Sre", numDay: "22", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Cet", numDay: "23", isSelected: false, width: 50, height: 60, action: {}),
           DateData(weekDay: "Pet", numDay: "24", isSelected: false, width: 50, height: 60, action: {})
       ]
    
    func toggleDateSelection(index: Int) {
        withAnimation(.spring()) {
            dates[index].isSelected.toggle()
        }
    }
    
    @Published
    var times: [TimeData] = [
        TimeData(hour: "17:00", isSelected: false, width: 50, height: 50, action: {}),
        TimeData(hour: "18:00", isSelected: false, width: 50, height: 50, action: {}),
        TimeData(hour: "19:00", isSelected: false, width: 50, height: 50, action: {}),
        TimeData(hour: "20:00", isSelected: false, width: 50, height: 50, action: {}),
        TimeData(hour: "21:00", isSelected: false, width: 50, height: 50, action: {})
    ]
    
    func toggleTimesSelection(index: Int){
        withAnimation {
            times[index].isSelected.toggle()
        }
    }
    
    
}
