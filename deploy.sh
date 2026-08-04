#!/bin/sh
# 部署个人主页到 https://limigwenshao.github.io
# 用法：./deploy.sh "本次改动说明"        （说明可省略）
set -e
cd "$(dirname "$0")"

MSG="${1:-Update homepage}"

if [ -z "$(git status --porcelain)" ]; then
  echo "没有改动，无需部署。"
  exit 0
fi

git add -A
git commit -q -m "$MSG"

# GitHub 偶发 SSL 断连，失败自动重试
n=1
until git push -q; do
  n=$((n+1))
  if [ "$n" -gt 5 ]; then echo "推送失败，请稍后重试。"; exit 1; fi
  echo "推送失败，第 $n 次重试…"
  sleep 5
done

echo "已推送，等待 GitHub Pages 部署…"
SHA=$(git rev-parse --short HEAD)
n=1
while [ "$n" -le 40 ]; do
  if curl -fsS "https://limigwenshao.github.io/?_=$SHA$n" >/dev/null 2>&1; then
    sleep 4
    echo "✅ 已上线：https://limigwenshao.github.io  ($SHA)"
    exit 0
  fi
  n=$((n+1)); sleep 5
done
echo "⚠️  已推送但未确认上线，稍后手动刷新看看。"
