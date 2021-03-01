cask "mailtrackerblocker" do
  version "0.3.14"
  sha256 "689357a565a62ad715d4b0dd38503395ee7089c1cb2ff6357f92382702b8c430"
  
  url "https://github.com/apparition47/MailTrackerBlocker/releases/download/#{version}/MailTrackerBlocker.pkg"
  appcast "https://github.com/apparition47/MailTrackerBlocker/releases.atom"
  name "MailTrackerBlocker"
  desc "An email tracker, read receipt and spy pixel blocker plugin for macOS Apple Mail."

  homepage "https://apparition47.github.io/MailTrackerBlocker/"
  depends_on macos: ">= :el_capitan"
  pkg 'MailTrackerBlocker.pkg'
  uninstall pkgutil: "com.onefatgiraffe.mailtrackerblocker", 
  			delete: "/Library/Mail/Bundles/MailTrackerBlocker.mailbundle", 
  			quit: ["com.apple.mail"]

  def caveats
    <<~EOS
      ℹ️  To enable and use (you'll need to do this again after updating):
        1. Open Mail, goto Preferences > General > Manage Plug-ins... > 
           check "MailTrackerBlocker.mailbundle" > Apply and Restart Mail.
        2. Tap on the ⓧ  button to find out what was blocked.

      ⚠️  Note:
        Disabling "load remote content in messages" 
        with MailTrackerBlocker enabled is redundant; 
        re-enable this option for the best experience.
    EOS
  end
end
