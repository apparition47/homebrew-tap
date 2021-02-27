cask "mailtrackerblocker" do
  version "0.3.12"
  sha256 "bd483320176ce9b64e8dc975918a80e06d27b978ac140a8e9cb397e8a1007817"
  
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
