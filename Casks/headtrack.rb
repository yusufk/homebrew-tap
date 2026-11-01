cask "headtrack" do
  version "0.1.2"
  sha256 "57c248ce52c53ab0d13f4bd5133a9928de8f6e4cb2f221c0cd1f9ac1bf04b3f1"

  url "https://github.com/yusufk/head-tracked-audio/releases/download/v#{version}/HeadTrack-v#{version}.dmg"
  name "HeadTrack"
  desc "Head-tracked spatial audio for any headphones, using the webcam"
  homepage "https://github.com/yusufk/head-tracked-audio"

  depends_on macos: :sequoia

  app "HeadTrack.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/HeadTrack.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Logs/HeadTrack",
    "~/Library/Preferences/com.yusufk.headtrack.plist",
  ]
end
