import SwiftUI

// (Goal) The user can adjust app settings.
struct SettingsView: View {
    // just temp testing
    @State private var vibrateOnRing = true
    @State private var toggleSetting2 = false

    // use Form?
    var body: some View {
        VoicePicker()
//        Toggle(isOn: $toggleSetting2) {
//            Text("hmm")
//        }
//        Toggle(isOn: $vibrateOnRing) {
//            Text("hmm2")
//        }
    }
}
