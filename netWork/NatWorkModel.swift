import Foundation
struct GeoLocation: Codable {
    let ip: String
    let city: String?
    let region: String?
    let country: String?
}

class NetWorkMannager{
    static let Shared = NetWorkMannager()
    let myAuthToken = "copied data"
    // MARK: How to ge the Auth Token
    // here we have to follow few steps to generate the auth token I am Going with the Most simple and easiest way
    // open https://ipinfo.io/account/home and login with the google accout or mail
    // go to token section in the side menu here you can go the token
    // simply copy and assign the value to "myAuthToken" then your redy to access the internet protocol detatils through out the word
    var locationCountry : GeoLocation  = GeoLocation(ip: "", city: "", region: "", country: "")
    func fetchLocationFromIP() {
        let url = URL(string: "https://ipinfo.io?token=\(myAuthToken)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data")
                return
            }
            
           
            do {
                let location = try JSONDecoder().decode(GeoLocation.self, from: data)
                
                if let country = location.country {
                    if country == "US" {
                        self.locationCountry = location
                        print("User is in the supported country: \(country)")
                    } else {
                        print("User is not in the supported country. They are in \(country).")
                        self.locationCountry = location
                    }
                } else {
                    print("Could not determine country from IP.")
                }
            } catch {
                print("Failed to parse JSON: \(error)")
            }
        }
        
        task.resume()
    }
   }

