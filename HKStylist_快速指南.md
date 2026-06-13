# HKStylist × MoneyPrinterTurbo 快速指南（全免費 stack）

## ✅ 已經幫你整好
- Clone 咗 repo 喺 `~/Desktop/MoneyPrinterTurbo`
- `config.toml` 已建立，並設定為免費 stack：
  - `llm_provider = "pollinations"`（AI 寫稿，**免費、無需 key**）
  - `subtitle_provider = "edge"`（字幕，快、免 GPU）
  - `video_source = "pexels"`（片段素材）
- 口語廣東話 system prompt：`HKStylist_粵語_system_prompt.txt`
- 環境確認齊全：Docker / ffmpeg / Python / uv 都已裝好

## 🔑 你仲要做（5 分鐘，唯一需要你親手嘅嘢）
1. 去 https://www.pexels.com/api/ 免費登記，攞 API key
2.（可選）去 https://pixabay.com/api/docs/ 攞多一個免費 key
3. 打開 `config.toml`，填入：
   ```toml
   pexels_api_keys = ["你嘅PEXELS_KEY"]
   pixabay_api_keys = ["你嘅PIXABAY_KEY"]   # 可選
   ```
   ⚠️ 一定要用英文半角雙引號 `"`，唔好用中文彎引號，否則 TOML 會 parse 失敗。

## ▶️ 啟動
```bash
cd ~/Desktop/MoneyPrinterTurbo
docker compose up
```
- WebUI：http://127.0.0.1:8501
- API docs：http://127.0.0.1:8080/docs

## 🎬 出第一條 HKStylist 短片（WebUI 步驟）
1. **語言**：揀 `zh-HK` / 廣東話
2. **配音 Voice**：揀 `zh-HK-HiuMaanNeural`（曉曼，女）/ `zh-HK-HiuGaaiNeural`（曉佳，女）/ `zh-HK-WanLungNeural`（雲龍，男）
3. **影片比例**：9:16（直度，適合 IG Reels / TikTok / Shorts）
4. 展開 **「高級腳本設置 / Advanced Script Settings」** → 剔 **「Use Custom System Prompt」**
   → 將 `HKStylist_粵語_system_prompt.txt` 全部內容貼入個文字框（**呢步先令到稿件變真・口語廣東話**）
5. **Video Subject** 填主題，例如：「秋冬通勤穿搭」「小個子顯高搭配」「方臉啱咩髮型」
6. 撳生成文案 → 檢查稿件係咪地道口語 → 撳生成影片

## 💡 HKStylist 專屬貼士
- **用自己嘅片更 on brand**：Pexels 通用素材未必夾時尚內容。喺 `config.toml` 設定
  `material_directory = "/你嘅穿搭片資料夾"`，AI 就會用你自己影嘅片，淨係幫你配稿、配音、剪字幕。
- **段落數**：短片建議 1–3 段，太多會過長。
- **想稿件質素更穩**：免費 pollinations 偶爾會塞；要量產可改用 DeepSeek（極平），
  喺 `config.toml` 設 `llm_provider = "deepseek"` + 填 `deepseek_api_key`。
- 字幕想更準（尤其中英夾雜）可改 `subtitle_provider = "whisper"`，但第一次會落 model、較慢。
