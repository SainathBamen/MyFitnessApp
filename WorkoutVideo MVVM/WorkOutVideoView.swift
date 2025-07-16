//
//  WorkOutVideoView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/06/25.
//

import SwiftUI
import WebKit

// MARK: - Body Parts Enum
enum BodyPart: String, CaseIterable, Identifiable {
    case chest, back, legs, arms, shoulder, abs, other

    var id: String { rawValue }

    var title: String {
        switch self {
        case .chest: return "🎬 Chest Workouts"
        case .back: return "🏋️‍♂️ Back Workouts"
        case .legs: return "🦵 Leg Workouts"
        case .arms: return "💪 Arm Workouts"
        case .other: return "💪 Other"
        case .shoulder:
            return "shoulder"
        case .abs:
            return ""
        }
    }

    var videoURLs: [String] {
        switch self {
        case .chest:
            return [
                "https://youtu.be/lvk2PMsuS88",
                "https://youtu.be/cYRWt674KHU",
                "https://youtu.be/ChDeUAJc9bE?si=dKhBUkEvl79w6qzq",
                "https://youtu.be/XoTXuZQ4SaU?si=5Gz6bo4tV7EBY_YZ"
            ]
        case .back:
            return [
                "https://youtu.be/qD-Wy01lfD0?si=zzKPWPvmBERataG1",
                "https://youtu.be/lxzHKplIcAM?si=XtOv9Vvepl2Gs-RO",
                "https://youtu.be/a3_yVGYwjzs?si=nMqeBu2IHU2J-kGL",
                "https://youtu.be/cUgCrWxOde0?si=Tbrniojs2gxsA8qW",
                "https://youtu.be/wpHO3DZpE4w?si=_LPP4o3em65p_sKx"
            ]
        case .legs:
            return [
                "https://youtu.be/IBp9TOCGIJI?si=zrKb7ys9R_tzfLS-",
                "https://youtu.be/9YeC8X5pIS0?si=A-CmTZDjgxrP59Bz",
                "https://youtu.be/KdX2kh4m5Tk?si=cN82ZWkO-cMaUdhk",
                "https://youtu.be/DpIeBMgh2OA?si=RRj5her29Sk8bwWv"
            ]
        case .arms:
            return [
                "https://youtu.be/uhYXfh2tPaU?si=Gp1bN0z2OY3htO4e",
                "https://youtu.be/y6CuJVVvSfI?si=uuEmLBNSaB5ovu5",
                "https://youtu.be/IzkS_pH5ebI?si=EUDzz6Fl5-zCEDE_",
                "https://youtu.be/Ua6phRsVMFo?si=FGwVgfXq4xeEDVgj"
            ]
        
        case .other:
            return [
                "https://youtu.be/6H5n8r9APgA"
            ]
        case .shoulder:
            return [
                "https://youtu.be/xnrJCzlOpS8?si=N5aS9MbICgAUN_4m",
                "https://youtu.be/mNnyBG8agxg?si=jzco0Ww_foU_O6ni",
                "https://youtu.be/1iDb6KeolWU?si=MiawQuhziJRtumLy",
                "https://youtu.be/FPb52-VLCVc?si=RX7lUhuCkLGSWF"
                
            ]
        case .abs:
            return [
                "https://youtu.be/Tn-XvYG9x7w?si=n7Rj6elaE7vg4qBx",
                "https://youtu.be/jyuT8km4viU?si=3VItGC969j8Sykpw",
                "https://youtu.be/uGFsXVmh0y8?si=cSy5RQT3Fs1h7rG9",
                "https://youtu.be/IrA9dvgRKR0?si=XKEF1JGeU3sDdyC5"
            ]
        }
    }
}

// MARK: - ViewModel
class WorkoutViewModel2: ObservableObject {
    @Published var selectedBodyPart: BodyPart = .chest

    var videoIDs: [String] {
        selectedBodyPart.videoURLs.compactMap { url in
            if let id = url.components(separatedBy: "/").last?.components(separatedBy: "?").first {
                return id
            }
            return nil
        }
    }
}

// MARK: - YouTube WebView
struct YouTubeWebView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let embedURL = URL(string: "https://www.youtube.com/embed/\(videoID)?playsinline=1")!
        webView.load(URLRequest(url: embedURL))
    }
}

// MARK: - Workout Home View
struct WorkoutHomeView: View {
    @StateObject private var viewModel = WorkoutViewModel2()

    var body: some View {
        NavigationStack {
            VStack {
                // Picker
                Picker("Select Body Part", selection: $viewModel.selectedBodyPart) {
                    ForEach(BodyPart.allCases) { part in
                        Text(part.rawValue.capitalized).tag(part)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                // Videos List
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(viewModel.selectedBodyPart.title)
                            .font(.title.bold())
                            .padding(.horizontal)

                        ForEach(viewModel.videoIDs, id: \.self) { id in
                            YouTubeWebView(videoID: id)
                                .frame(height: 250)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .background(
                    LinearGradient(colors: [.blue.opacity(0.1), .gray.opacity(0.1)],
                                   startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                )
            }
            .navigationTitle("🏋️‍♂️ Workout Videos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
#Preview {
    WorkoutHomeView()
}
