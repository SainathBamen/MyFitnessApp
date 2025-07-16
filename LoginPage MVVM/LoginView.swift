import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                // Decorative Circle
                VStack {
                    Circle()
                        .fill(LinearGradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
                                             startPoint: .top, endPoint: .bottom))
                        .frame(width: 500, height: 500)
                        .offset(y: -250)
                    Spacer()
                }
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 30) {
                        // App Icon
                        Image(systemName: "figure.walk.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.blue).frame(width: 120, height: 120))
                            .shadow(radius: 8)
                            .padding(.top, 40)

                        // Title
                        Text("Welcome Back!")
                            .font(.system(size: 34, weight: .heavy))
                            .foregroundStyle(
                                LinearGradient(colors: [Color.red, Color.orange],
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        // Input Fields
                        VStack(spacing: 24) {
                            CustomTextField(icon: "person.fill", placeholder: "Username", text: $viewModel.username)
                                .frame(maxWidth: 320)
                            CustomTextField(icon: "envelope.fill", placeholder: "Email", text: $viewModel.email, keyboardType: .emailAddress)
                                .frame(maxWidth: 320)
                            CustomSecureField(icon: "lock.fill", placeholder: "Password", text: $viewModel.password)
                                .frame(maxWidth: 320)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 10, y: 3)

                        // Error Message
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.subheadline)
                        }

                        // Login Button
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.login()
                            }
                        }) {
                            Text("Login")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300)
                                .frame(height: 55)
                                .background(
                                    LinearGradient(colors: [Color.blue, Color.purple],
                                                   startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(30)
                                .shadow(color: Color.purple.opacity(0.4), radius: 5, x: 0, y: 4)
                        }
                        .padding(.horizontal)

                        // Hidden NavigationLink
                        NavigationLink(destination: FitTabView(), isActive: $viewModel.isAuthenticated) {
                            EmptyView()
                        }

                        // Sign In Page Link
                        SignIn_Page()

                        Spacer(minLength: 30)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24, height: 24)
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
        }
        .padding()
        .frame(height: 50)
        .background(Color(.systemGray5).opacity(0.8))
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}


struct CustomSecureField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24, height: 24)
            SecureField(placeholder, text: $text)
        }
        .padding(10)
        .frame(height: 50)
        .background(Color(.systemGray5).opacity(0.8))
        .cornerRadius(80)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}

#Preview{
    LoginView()
}
