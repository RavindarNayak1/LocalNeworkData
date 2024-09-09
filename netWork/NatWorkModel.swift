import Foundation
struct GeoLocation: Codable {
    let ip: String
    let city: String?
    let region: String?
    let country: String?
}

class NetWorkMannager{
    static let Shared = NetWorkMannager()
    var locationCountry : GeoLocation  = GeoLocation(ip: "", city: "", region: "", country: "")
    func fetchLocationFromIP() {
        let url = URL(string: "https://ipinfo.io?token=ca4fff77d8dbed")!
        
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

