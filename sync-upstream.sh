#!/usr/bin/env bash
# 一鍵拉原作者(upstream)嘅最新更新落自己 main，再 push 上你嘅 fork。
# 用法： ./sync-upstream.sh
set -euo pipefail

echo "▶ 攞 upstream (harry0703/MoneyPrinterTurbo) 最新 commit..."
git fetch upstream

echo "▶ 切去 main..."
git checkout main

echo "▶ 將 upstream/main 併入你嘅 main..."
if git merge upstream/main --no-edit; then
  echo "✅ 合併成功。"
else
  echo "⚠ 有衝突 —— 即係你改過嘅同一行，上游又改咗。"
  echo "  請手動解決衝突後執行： git add . && git commit"
  exit 1
fi

echo "▶ Push 上你個 fork (origin)..."
git push origin main
echo "🎉 完成！你嘅 fork 已同步到上游最新版，自訂改動保留。"
