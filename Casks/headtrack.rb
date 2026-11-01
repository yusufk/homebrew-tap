cask "headtrack" do
  version "0.1.0"
  sha256 "04c408b7010d9856da2dbcbdbc528374e41c9c02a1ed096b72c2346f585118e0"

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
