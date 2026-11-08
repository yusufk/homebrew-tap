cask "headtrack" do
  version "0.1.3"
  sha256 "b72556e84fd2e34931e03bc327c5983a6912242193cb60581474a174c2e9c4b0"

  url "https://github.com/yusufk/head-tracked-audio/releases/download/v#{version}/HeadTrack-v#{version}.dmg"
  name "HeadTrack"
  desc "Head-tracked spatial audio for any headphones, using the webcam"
  homepage "https://github.com/yusufk/head-tracked-audio"

  depends_on macos: :sequoia

  app "HeadTrack.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/HeadTrack.app"]
  end

  zap trash: [
    "~/Library/Logs/HeadTrack",
    "~/Library/Preferences/com.yusufk.headtrack.plist",
  ]
end
