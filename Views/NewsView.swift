import SwiftUI

struct NewsView: View {
    var newsView: FilActuItem
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 335)
                .foregroundColor(Color(red: 150 / 255, green: 159 / 255, blue: 170 / 255, opacity: 0.1))
            VStack(alignment: .leading) {
                Text(newsView.filActuName)
                    .font(.headline)
                Image(newsView.filActuImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                HStack{
                    Text(newsView.commentaire)
                        .font(.headline)
                    Spacer()
                    Image("Like")
                    Image("Comment")
                    Image("send")
                }
            }
        }
    }
}
struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(newsView: FilActuItem(filActuName: "Quel peloton", filActuImage: "peloton", profilName: "", commentaire: "ça va vite!"))
    }
}
