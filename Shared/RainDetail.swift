//
//  RainDetail.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/12/20.
//

import SwiftUI

struct RainDetail: View {
    @State var rainHR: Float? = 0.0
    
    func getRainData() {
        
        let jsonURLString = "https://api.openweathermap.org/data/2.5/onecall?lat=38.7892&lon=-90.3226&exclude=current,minutely,daily&units=imperial&appid=" + String(appid)
        
        // make URL
        guard let url = URL(string: jsonURLString) else { return }
        // create a session
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        // check for error
        if error != nil {
            print(error!.localizedDescription)
        }
        // check for 200 OK status from dataTask
        guard let data = data else { return }
        do {
            let rain = try JSONDecoder().decode(RainJSON.self, from: data)
            self.rainHR = (rain.hourly?[7].rain?.oneh) ?? 0.0
            
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
    var body: some View {
        Text("\(self.rainHR!)")
    }
}

struct RainDetail_Previews: PreviewProvider {
    static var previews: some View {
        RainDetail()
    }
}
