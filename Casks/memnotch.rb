cask "memnotch" do
  version "1.0.0"
  sha256 "e719dd81363cf45a0f246fdf6c5eeec062a33c6af0514dd2bdcb9dde6c725ebc"

  url "https://github.com/mem-shibata/MemNotch-releases/releases/download/v#{version}/MemNotch-#{version}.zip"
  name "MemNotch"
  desc "Notch utility app for internal use"
  homepage "https://github.com/mem-shibata/MemNotch-releases"

  depends_on macos: ">= :sonoma"

  app "MemNotch.app"

  # 更新・削除の前に MemNotch を終了する
  uninstall quit: "jp.co.members.MemNotch"

  # 社内配布のため Apple の公証を受けていない。ダウンロード時に付く隔離属性を外し、
  # Gatekeeper の「開発元を確認できません」を出さないようにする（改ざんの確認は sha256 で行う）
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/MemNotch.app"]
    system_command "/usr/bin/open", args: ["#{appdir}/MemNotch.app"]
  end

  # brew uninstall --zap --cask memnotch のときだけ、データ（トレイ・ToDo・メモ・設定）も消す
  zap trash: "~/Library/Containers/jp.co.members.MemNotch"
end
