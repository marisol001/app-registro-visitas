//
//  RegisterView.swift
//  visitas
//
//  Created by Marisol Reyes Espino on 10/11/21.
//

import SwiftUI
import MapKit

struct RegisterView: View {
    @State var inputText: String = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        ScrollView {
            VStack {
                Text("Registro de Visitas")
                    .font(.title)
                Text("Lunes 8 de Noviembre")
                    .font(.caption)
                    .alignmentGuide(.leading) { dimension in
                        dimension[.bottom]
                    }
                    .padding()
                Text("Tiempo transcurrido")
                    .font(.body)
                Text("2:25")
                    .font(.body).bold()
                    .padding()
                
                TextField("Nombre Completo", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.caption2)
                
                Text("Ciudad de México")
                    .font(.caption)
                    .alignmentGuide(.leading) { dimension in
                        dimension[.bottom]
                    }
                    .padding()
                Map(coordinateRegion: $region)
                            .frame(width: 300, height: 300)
                    .padding()
                
                Menu("Motivo de su visita") {
                    Button("Consulta", action: placeOrder)
                    Button("RH", action: adjustOrder)
                }
                .menuStyle(RedMenu())
                //Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterView()
        }
    }
}

struct RedMenu: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .foregroundColor(.red)
    }
}

func justDoIt() {
    print("Button was tapped")
}

func placeOrder() { }
func adjustOrder() { }
func rename() { }
func delay() { }
func cancelOrder() { }


struct SelectionCell: View {

    let fruit: String
    @Binding var selectedFruit: String?

    var body: some View {
        HStack {
            Text(fruit)
            Spacer()
            if fruit == selectedFruit {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }   .onTapGesture {
                self.selectedFruit = self.fruit
            }
    }
}
