cask "zoomacit" do
  version :latest
  sha256 :no_check

  url "https://github.com/yusufk/ZoomacIt/releases/latest/download/ZoomacIt-v#{version}.dmg"
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
