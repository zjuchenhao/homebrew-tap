# zjuchenhao/homebrew-tap

Personal Homebrew tap for macOS casks and formulae.

> 注意:GitHub 仓库名是 `zjuchenhao/homebrew-tap`,但 Homebrew 的 tap 名是
> **`zjuchenhao/tap`**(brew 会去掉仓库名的 `homebrew-` 前缀)。

## 使用

```sh
brew tap zjuchenhao/tap
brew trust zjuchenhao/tap        # 自定义 tap 默认 untrusted,需手动信任
brew install --cask zjuchenhao/tap/tokenremain
```

## 自动更新(维护者)

`.github/workflows/bump-tap.yml` 每 3 小时运行一次,自动完成所有包的更新:

1. `brew livecheck --tap=zjuchenhao/tap` 检测所有 cask / formula 是否有新版本
2. 对每个有更新的包,`brew bump-cask-pr --write-only`(或 `bump-formula-pr --write-only`)
   直接修改 rb 文件并提交 —— 过程中会下载新包重新计算 sha256,下载失败则不会提交
3. 更新直接 push 到 `main`,**无需审核**;用户端 `brew update && brew upgrade` 即可更新

> 个人 tap 不需要 PR 审查环节,直接提交避免了 PR 流程的额外依赖
> (GITHUB_TOKEN 权限、分支冲突、遗留分支等)。

### 新增包的约定

- **每个 cask / formula 必须带 `livecheck` 块**;没有的包会被 workflow 跳过(日志中会有 warning)
- `livecheck` 块返回的版本字符串**必须与 cask 的版本格式完全一致**(包括逗号后缀,如 `1.3.7,34`),否则无法正确拼接下载 URL

### 示例

GitHub releases 类:

```ruby
livecheck do
  url "https://github.com/OWNER/REPO/releases/latest"
  strategy :github_latest
end
```

带构建号(Sparkle appcast,版本由 `shortVersionString,version` 组成):

```ruby
livecheck do
  url "https://github.com/OWNER/REPO/releases/latest/download/appcast.xml"
  strategy :sparkle do |item|
    "#{item.short_version},#{item.version}"
  end
end
```

本地验证: `brew livecheck --cask <full-name>`,输出 `当前版本 ==> 最新版本` 即正常。

### 手动更新

```sh
brew livecheck --cask zjuchenhao/tap/tokenremain   # 检查
brew bump-cask-pr --write-only --commit --version "1.3.8,35" zjuchenhao/tap/tokenremain
git -C "$(brew --repository zjuchenhao/tap)" push origin main  # 提交已由 --commit 完成
```
