class Noclamshell < Formula
  desc "Sleep despite annoying clamshell mode"
  homepage "https://github.com/pirj/noclamshell"
  url "https://github.com/pirj/noclamshell.git", tag: "1.1", revision: "3c540e8be43ccef8efc0711c4c446b0996a0061a"
  head "https://github.com/pirj/noclamshell.git", branch: "master"

  def install
    bin.install "noclamshell"
  end

  plist_options manual: "noclamshell"

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
            <string>#{opt_bin}/noclamshell</string>
          </array>
      </dict>
    </plist>
    XML
  end

  test do
    system bin/"noclamshell"
  end
end
