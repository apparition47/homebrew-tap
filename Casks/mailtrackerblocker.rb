cask "mailtrackerblocker" do
  version "0.3.13"
  sha256 "1a0a3dc3ccf81786b4ad938c62e66255a65eeeef913f103cb2726601c4ced9d6"
  
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
      ℹ️  To enable and use:
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
