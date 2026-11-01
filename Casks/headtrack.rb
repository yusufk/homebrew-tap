cask "headtrack" do
  version "0.1.1"
  sha256 "0f77cc1b9ddb3e2a231301c09bef24e73e4b21788bfbe676b58a0195db517724"

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
