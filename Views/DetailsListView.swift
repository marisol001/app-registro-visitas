//
//  DetailsListView.swift
//  visitas
//
//  Created by Marisol Reyes Espino on 10/11/21.
//

import SwiftUI

struct DetailsListView: View {
    var visitor: Visitor
    @State private var progress = 0.5

    var body: some View {
        ScrollView {
            VStack {
                Text("Enviar datos")
                    .font(.title2).bold()
                
                Text("Por favor espere")
                    .font(.caption)
                    .padding()
                
                Text("Validando su conexión a Internet")
                    .font(.caption).italic()
                    .padding()
                
                Text("Etapa 1 Enviando datos:")
                    .font(.caption)
                    .padding()
                
                HStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .scaleEffect(2)
                    Text("Nombre")
                    Text("Motivo de visita")
                    
                    
                }
                .frame(width: 280, height: 200)
                .background(Color.gray)

                ProgressView(value: 1).padding()
                
                visitor.avatar
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .shadow(color: Color.red, radius: 5)
                Text(visitor.name)
                    .font(.largeTitle)
                Text(visitor.typeVisit)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct DetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsListView(visitor: Visitor(id: 1, name: "Marisol", avatar: Image(systemName: "person"), date: "20 June", address: "Mexico City", hour: "2:20", typeVisit: "Duda"))
    }
}

struct ShadowedProgressViews: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.25)
            ProgressView(value: 0.75)
        }
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
