cask "zoomacit" do
  version "1.0.0"
  sha256 "57756e98d634df84262a9376c4b52ec9385e7c8a9cfe9e8cb2d6b24134857d45"

  url "https://github.com/yusufk/ZoomacIt/releases/download/v#{version}/ZoomacIt-v#{version}.dmg"
  name "ZoomacIt"
  desc "ZoomIt-style screen zoom, draw, and annotation tool for macOS"
  homepage "https://github.com/yusufk/ZoomacIt"

  depends_on macos: ">= :sequoia"

  app "ZoomacIt.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ZoomacIt.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/net.07jp27.ZoomacIt.plist",
    "~/Library/Application Support/ZoomacIt",
  ]
end
