import Foundation

struct DataItem: Codable {
    var a: Int
    var b: Double
}

var data = DataItem(a:0, b:0.0)
print(data)

var e: Data? = try? JSONEncoder().encode(data)

//You can force unwrap e because we know it's codable
print(String(data:e!, eoncding: .utf8)!)

var data2: Data? = try? JSONDecoder().decode(DataItem.self, from: e!)
print(data2!)

public extension UserDefaults {
    //Takes an object of type T and encodes it using the JSONencoder
    //Then uses the built in set method to add it to userDefaults
    func setCodable<T: Codable>(_ object: T, forKey: String) throws {
        let jsonData: Data = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey)
    }

    func getCodable<T: Codable>(_ ot: T.Type, forKey: String) -> T? {
        //Value is a built in function of Userdefaults that retrieves a value associated with forKey
        guard let result = value(forKey: forKey) as? Data else {
            return nil›
        }
        return try? JSONDecoder().decode(ot, from: result)
    }

}

//for tells us where in the sandbox are we looking, in tells us what is the higher level availability
//userDomainMask means we're looking user files
//appropriateFOr will usually be nil
//create specifies whether to create a file if it doesn't exist
//url() returns a URL or throws an exception
let url: URL? = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

let items: [String] = try? FileManager.default.contentsOfDirectory(atPath: url!.path)
//Given a string path, return [String] or throw an error

let items: [URL]

//Creating Files and Directories

//we are creating a new URL with stuff added to the end
if let file = url?.appendingPathComponent("stuff")
{
    let encoder = JSONEncoder.init()
    let data: Data? = try? encoder.encode(model.data)
    FileManager.defualt.createFile(
        atPath: file.path,
        contents: data,
        attributes: nil
        )
    )
}

FileManager.default.createDirectory(at: url!, withIntermediateDirectories: true, attributes: nil)
FIleManager.default.createDirectory(atPath: url!.path, withIntermediateDirectories: true, attributes:nil)

//Reading and Writing a File

//reading a JSON-encoded file

let decoder = JSONDecoder.init()
if let data - FileManager.default.contents(atPath: url!.path) {
    if let ddata = try? decoder.decode(DataItem.self, from: data) {
        model.data = data
    }
}

//Creating writing and reading files without FileManger.default

if let file = url?.appendingPathComponent("stuff")
{
    let encoder - JSONEncoder.init()
    let data: Data? = try? encoder.encode(model.data)
    try? data?.write(to: file)
}

//Mvoing, copying, deleting items
moveItem(at: URL, to: URL)
moveItem(atPath: String, toPath: String)

copyItem(at: URL, to: URL)
copyItem(atPath: String, toPath: String)

//USING LOCATION IN YOUR MODEL
import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationmanager()

    @Published var location: CLLocation?

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization() // don't get location all the time only when you're using the app
        self.locationManager.startUpdatingLocation() 
    }
}

extension LocationManager : CLLocationManagerDelegate {
    //Takes a CLLocationManger and an array of locations. We're just checking if locations is empty. If there is a last element
    //We want to update our location to the last location
    func locationManger(_ manager: CLLocationManger, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else { return }
        self.location = location
    }
}

struct DirEntry: Codable, Identifiable {
    var id: String?
    var name: String
    var phone: String
    var email: String

    //This is optional because we are not going to produce a dictionary unless id has been set.
    //So if id is nil we are gonna return nil
    //if id isn't nil we're going to create the NSDictionary
    var dict: NSDictionary? {
        if let idStr = id {
            let d = NSDictionary(dictionary: [
                
            ])
        }
    }
}