//
//struct loginPg2: View {
//    @State private var selectedButton: Int? = nil
//    @State private var showNextScreen: Bool = false
//    
//    func createButton(buttonNumber: Int, control: DeviceControl) -> some View {
//        return Button(action: {
//            selectedButton = buttonNumber
//            fetchEnumValue(for: control) { (enumValue, error) in
//                if let error = error {
//                    print("Error:", error)
//                } else if let enumValue = enumValue {
//                    print(enumValue)
//                }
//            }
//        }) {
//            Image(selectedButton == buttonNumber ? "pressed.png" : "unpressed.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//        }
//    }
//    
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            // Button 1
//            createButton(buttonNumber: 1, control: .radioOnOff)
//                .position(x: 22, y: 242)
//            
//            // Repeat this for other createButton instances
//            
//            // Button 2
//            createButton(buttonNumber: 2, control: .acOnOff)
//                .position(x: 22, y: 372.75)
//            
//            // Button 3
//            createButton(buttonNumber: 3, control: .acTemperature)
//                .position(x: 22, y: 503.5)
//            
//            // Button 4
//            createButton(buttonNumber: 4, control: .radioVolume)
//                .position(x: 22, y: 634.25)
//            
//            Color.white
//            
//            Text("Good day, PennApps")
//                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
//                .padding(.top, 20)
//                .padding(.leading, 30)
//                .font(.system(size: 16))
//            
//            Text("What would you like to choose for finger 2?")
//                .bold()
//                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
//                .padding(.top, 60)
//                .padding(.leading, 30)
//                .padding(.trailing, 180)
//                .font(.system(size: 18))
//            
//            RoundedRectangle(cornerRadius: 68)
//                .frame(width: 76, height: 24)
//                .padding(.top, 110)
//                .padding(.leading, 30)
//            
//            Text("Popular")
//                .padding(.top, 113)
//                .padding(.leading, 44)
//                .foregroundColor(Color(red: 238.0/255.0, green: 221.0/255.0, blue: 203.0/255.0))
//                .font(.system(size: 14))
//            
//            Image("two.png")
//                .resizable()
//                .frame(width: 107, height: 161)
//                .padding(.top, 0)
//                .padding(.leading, 210)
//            
//            Rectangle()
//                .fill(Color(red: 208.0/255.0, green: 216.0/255.0, blue: 214.0/255.0))
//                .frame(width: 400, height: 573)
//                .padding(.top, 150)
//            
//            Image("unpressed.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//                .padding(.top, 230)
//                .padding(.leading, 10)
//            
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.white)
//                .frame(width: 332, height: 104.75)
//                .padding(.top, 190.75)
//                .padding(.leading, 40)
//            
//            Image("unpressed.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//                .padding(.top, 360.75)
//                .padding(.leading, 10)
//            
//            Text("INCREASE/DECREASE")
//                .font(.system(size: 10))
//                .padding(.top, 220)
//                .padding(.leading, 60)
//            
//            Text("RADIO VOLUME")
//                .font(.system(size: 16))
//                .padding(.top, 240)
//                .bold()
//                .padding(.leading, 60)
//            
//            Image("volume.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 70, height: 93)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
//                .padding(.top, 196.75)
//                .padding(.leading, 295)
//            
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.white)
//                .frame(width: 332, height: 104.75)
//                .padding(.top, 320.5)
//                .padding(.leading, 40)
//            
//            Image("unpressed.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//                .padding(.top, 491.5)
//                .padding(.leading, 10)
//            
//            Text("ON/OFF")
//                .font(.system(size: 10))
//                .padding(.top, 349.75)
//                .padding(.leading, 60)
//            
//            Text("AIR CONDITIONING (AC)")
//                .font(.system(size: 16))
//                .padding(.top, 369.75)
//                .bold()
//                .padding(.leading, 60)
//            
//            Image("ac.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 70, height: 93)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
//                .padding(.top, 326.5)
//                .padding(.leading, 295)
//            
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.white)
//                .frame(width: 332, height: 104.75)
//                .padding(.top, 450.25)
//                .padding(.leading, 40)
//            
//            Text("ON/OFF")
//                .font(.system(size: 10))
//                .padding(.top, 479.5)
//                .padding(.leading, 60)
//            
//            Text("AC TEMPERATURE")
//                .font(.system(size: 16))
//                .padding(.top, 499.5)
//                .bold()
//                .padding(.leading, 60)
//            
//            Image("temp.png")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 70, height: 93)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
//                .padding(.top, 456.25)
//                .padding(.leading, 295)
//            
//            RoundedRectangle(cornerRadius: 10)
//        }
//    }
//}
