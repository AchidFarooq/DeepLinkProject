import Foundation

let locationReceivedFromDeeplink = "locationReceivedFromDeeplink"
let cityName = "cityName"


@objc public extension UserDefaults {
    
    @objc func setLocationReceived() {
        self.set(true, forKey: locationReceivedFromDeeplink)
    }
    
    @objc func resetLocationReceived() {
        self.set(false, forKey: locationReceivedFromDeeplink)
    }
    
    @objc func getLocationReceived() -> Bool {
        return self.bool(forKey: locationReceivedFromDeeplink)
    }
    
    @objc func setCity(_ urlString: String) {
        let city = urlString.substring(from: "$$$", to: "$$$")
        if let firstElement = city.first {
            self.set(firstElement, forKey: cityName)
        }
    }

    
    @objc func getCityName() -> String? {
        return self.string(forKey: cityName)
    }
    
    @objc func resetCity() {
        self.removeObject(forKey: cityName)
    }
}
