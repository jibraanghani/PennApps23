import SwiftUI
import Foundation
import Foundation


func initializeBackend() {
    guard let url = URL(string: "http://localhost:5000") else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                print("Backend initialized successfully!")
            } else {
                print("Failed to initialize backend. HTTP Status: \(httpResponse.statusCode)")
            }
        }
    }
    task.resume()
}



struct coverImg: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("cover.png")
                
                Text("ambi.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 238.0/255.0, green: 221.0/255.0, blue: 203.0/255.0))
                    .padding(.leading, -100)
                    .padding(.top, -170)
                
                .background(
                    NavigationLink(destination: loginPg(), isActive: $navigate) {
                        EmptyView()
                    }
                )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                navigate = true
            }
        }
    }
}

struct coverImg_Previews: PreviewProvider {
    static var previews: some View {
        coverImg()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            loginPg()
            loginPg2()
        }
    }
}

struct loginPg: View {
    @State private var showNextScreen: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
           

            Color.white

            Text("Good day, Allie")
                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
                .padding(.top, 20)
                .padding(.leading, 30)
                .font(.system(size: 16))

            Text("Raise these fingers to access the following hardware:")
                .bold()
                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
                .padding(.top, 60)
                .padding(.leading, 30)
                .padding(.trailing, 100)
                .font(.system(size: 18))
            
            Rectangle()
                .fill(Color(red: 208.0/255.0, green: 216.0/255.0, blue: 214.0/255.0))
                .frame(width: 400, height: 573)
                .padding(.top, 150)

          
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 190.75)
                .padding(.leading, 40)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 580)
                .padding(.leading, 40)
            
            Image("one.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 184.75)
                .padding(.leading, 200)

           
            Text("LIGHTS")
                .font(.system(size: 16))
                .padding(.top, 240)
                .bold()
                .padding(.leading, 60)

            
            Image("lights.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 93)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 196.75)
                .padding(.leading, 295)

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 320.5)
                .padding(.leading, 40)

       
            Text("AIR CONDITIONING (AC) FAN")
                .font(.system(size: 16))
                .padding(.top, 369.75)
                .bold().padding(.trailing, 150)
                .padding(.leading, 60)

            Image("ac.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 93)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 326.5)
                .padding(.leading, 295)

            Image("two.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 314.75)
                .padding(.leading, 210)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 450.25)
                .padding(.leading, 40)

       
           
                Text("RADIO STATION")
                    .font(.system(size: 16))
                    .padding(.top, 499.5)
                    .bold()
                    .padding(.leading, 60)
            
            


            Image("three.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 444.75)
                .padding(.leading, 210)
            
            Image("fan.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 93)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 456.25)
                .padding(.leading, 295)
            
            
            Image("four.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 574.75)
                .padding(.leading, 210)

            
            Text("RADIO VOLUME")
                .font(.system(size: 16))
                .padding(.top, 629.25)
                .bold()
                .padding(.leading, 60)

            Image("volume.png")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 93)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 586)
                .padding(.leading, 295)

            NavigationLink(destination: loginPg2()
                         , isActive: $showNextScreen) {
                ZStack() {
                    RoundedRectangle(cornerRadius: 68)
                        .foregroundColor(Color(red: 238.0/255.0, green: 221.0/255.0, blue: 203.0/255.0))
                        .frame(width: 76, height: 24)
                        .padding(.top, 735)
                        .padding(.leading, 260)
                        .overlay(
                            Text("Next")
                                .padding(.top, 735)
                                .padding(.leading, 260)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14))
                        )
                }
                .onTapGesture {
                    showNextScreen = true
                }
            }
        }
    }
}

struct RadioStationPage: View {
    var body: some View {
        Text("Hi")
    }
}

struct loginPg2: View {
    @State private var showPrevScreen: Bool = false
    @State private var showNextScreen: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
           

            Color.white

            Text("Good day, Allie")
                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
                .padding(.top, 20)
                .padding(.leading, 30)
                .font(.system(size: 16))

            Text("From the hardware you selected, raise these fingers to adjust:")
                .bold()
                .foregroundColor(Color(red: 35.0/255.0, green: 12.0/255.0, blue: 2.0/255.0))
                .padding(.top, 60)
                .padding(.leading, 30)
                .padding(.trailing, 100)
                .font(.system(size: 18))
            
            Rectangle()
                .fill(Color(red: 208.0/255.0, green: 216.0/255.0, blue: 214.0/255.0))
                .frame(width: 400, height: 573)
                .padding(.top, 150)

          
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 190.75)
                .padding(.leading, 40)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 580)
                .padding(.leading, 40)
            
            Image("one.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 184.75)
                .padding(.leading, 200)

           
            Text("ON")
                .font(.system(size: 16))
                .padding(.top, 240)
                .bold()
                .padding(.leading, 60)

            

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 320.5)
                .padding(.leading, 40)

       
            Text("OFF")
                .font(.system(size: 16))
                .padding(.top, 369.75)
                .bold().padding(.trailing, 150)
                .padding(.leading, 60)



            Image("two.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 314.75)
                .padding(.leading, 210)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 332, height: 104.75)
                .padding(.top, 450.25)
                .padding(.leading, 40)

       
            Text("INCREASE")
                .font(.system(size: 16))
                .padding(.top, 499.5)
                .bold()
                .padding(.leading, 60)

            Image("three.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 444.75)
                .padding(.leading, 210)
            
            
            
            Image("four.png")
                .resizable()
                .frame(width: 80, height: 104.75)
                .padding(.top, 574.75)
                .padding(.leading, 210)

            
            Text("DECREASE")
                .font(.system(size: 16))
                .padding(.top, 629.25)
                .bold()
                .padding(.leading, 60)

            NavigationLink(destination: loginPg(), isActive: $showPrevScreen) {
                ZStack() {
                    RoundedRectangle(cornerRadius: 68)
                        .foregroundColor(Color(red: 238.0/255.0, green: 221.0/255.0, blue: 203.0/255.0))
                        .frame(width: 76, height: 24)
                        .padding(.top, 735)
                        .padding(.leading, 50)
                        .overlay(
                            Text("Prev")
                                .padding(.top, 735)
                                .padding(.leading, 50)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14))
                        )
                }
                .onTapGesture {
                    showPrevScreen = true
                }
            }
            
            NavigationLink(destination: camPg(), isActive: $showNextScreen) {
                ZStack() {
                    RoundedRectangle(cornerRadius: 68)
                        .foregroundColor(Color(red: 238.0/255.0, green: 221.0/255.0, blue: 203.0/255.0))
                        .frame(width: 76, height: 24)
                        .padding(.top, 735)
                        .padding(.leading, 260)
                        .overlay(
                            Text("Next")
                                .padding(.top, 735)
                                .padding(.leading, 260)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14))
                        )
                }
                .onTapGesture {
                    showNextScreen = true
                }
            }
        }
        
    }
    
}

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Environment(\.presentationMode) var presentationMode

        init(image: Binding<UIImage?>) {
            _image = image
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                image = uiImage
            }

            presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraView>) {}
}

struct camPg: View {
    @State private var image: UIImage?
    @State private var showingCamera = false

    var body: some View {
        VStack {
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No Image")
            }

            Button("Open Camera") {
                showingCamera = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .sheet(isPresented: $showingCamera, onDismiss: loadImage) {
                CameraView(image: self.$image)
            }
        }
    }

    func loadImage() {
        // you can process the image here if needed
    }
}
