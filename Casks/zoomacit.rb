cask "zoomacit" do
  version "1.0.1"
  sha256 "04c789fcfb1914f8bb115735e90428f1bfe364133399e5198339bf1fc119dda7"

  url "https://github.com/yusufk/ZoomacIt/releases/download/v#{version}/ZoomacIt-v#{version}.dmg"
  name "ZoomacIt"
  desc "ZoomIt-style screen zoom, draw, and annotation tool for macOS"
  homepage "https://github.com/yusufk/ZoomacIt"

  depends_on macos: :sequoia

  app "ZoomacIt.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/ZoomacIt.app"]
  end

  zap trash: [
    "~/Library/Preferences/net.07jp27.ZoomacIt.plist",
    "~/Library/Application Support/ZoomacIt",
  ]
end
