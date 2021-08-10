class NoclamshellM1 < Formula
  desc "Sleep despite annoying clamshell mode"
  homepage "https://github.com/thatrobotdev/noclamshell"
  url "https://github.com/thatrobotdev/noclamshell.git", tag: "m1", revision: "29eae24d4d9b9e422602eb79b2f733c08f03f9f5"
  head "https://github.com/thatrobotdev/noclamshell.git", branch: "master"

  def install
    bin.install "noclamshell-m1"
  end

  plist_options manual: "noclamshell-m1"

  def plist; <<~XML
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key><string>#{plist_name}</string>
        <key>ThrottleInterval</key> <integer>2</integer>
        <key>KeepAlive</key> <true/>
        <key>ProgramArguments</key>
          <array>
            <string>bash</string>
            <string>-c</string>
            <string>#{opt_bin}/noclamshell-m1</string>
          </array>
      </dict>
    </plist>
    XML
  end

  test do
    system bin/"noclamshell"
  end
end
