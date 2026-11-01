<div dir="rtl">

# 🧠 اسکیل‌های هوش مصنوعی برای Claude Code، OpenCode و Hermes

**۵۱ اسکیل** از بهترین منابع دنیا، در **۱۰ دسته**، با یک اسکریپت نصب برای هر سه ابزار.

منابع: مخزن رسمی [Anthropic][an]، [superpowers][sp] (پرطرفدارترین مجموعهٔ جامعه)، [Matt Pocock][mp]، [Trail of Bits][tob] (امنیت)، [Vercel][vc]، [Supabase][sb] و ۷ اسکیل که مخصوص همین مخزن نوشته شده‌اند.

</div>

> **English:** 51 curated agent skills in 10 categories, taken from the best public collections (Anthropic, obra/superpowers, Matt Pocock, Trail of Bits, Vercel, Supabase) plus 7 original ones. Every skill uses the standard `SKILL.md` format and works in Claude Code, OpenCode and Hermes Agent. Clone and run `./install.sh`.

<div dir="rtl">

## ⚡ نصب سریع

</div>

```bash
git clone https://github.com/sherkat607-design/skills-for-Ai-harnes-By-ba9.git
```

```bash
cd skills-for-Ai-harnes-By-ba9 && ./install.sh
```

<div dir="rtl">

بعد از نصب، ابزار را یک بار ببندید و دوباره باز کنید.

| دستور | کار |
|---|---|
| `./install.sh` | نصب همه برای هر سه ابزار |
| `./install.sh claude` | فقط یک ابزار: `claude`، `opencode` یا `hermes` |
| `./install.sh --category security` | فقط یک یا چند دسته، مثلاً `--category planning,security` |
| `./install.sh --list` | نمایش همهٔ دسته‌ها و اسکیل‌ها |
| `./install.sh project ~/my-app` | کپی در پوشهٔ `.claude/skills` یک پروژه (Claude Code و OpenCode هر دو آن را می‌خوانند) |
| `./install.sh --copy` | کپی فایل‌ها به‌جای symlink (برای ویندوز/Git Bash هم مناسب است) |
| `./install.sh --force` | جایگزینی اسکیل‌های هم‌نامی که از قبل نصب شده‌اند |

- نصب پیش‌فرض با symlink است؛ پس با `git pull` همهٔ اسکیل‌ها به‌روز می‌شوند.
- اسکریپت هیچ‌وقت اسکیلی را که از قبل با همین نام دارید، بدون `--force` عوض نمی‌کند. در Hermes اگر اسکیلی با همین نام در دستهٔ دیگری باشد (مثلاً اسکیل‌های داخلی خود Hermes)، همان حفظ می‌شود.

| ابزار | محل نصب |
|---|---|
| Claude Code | `~/.claude/skills/<name>/` |
| OpenCode | `~/.config/opencode/skills/<name>/` |
| Hermes Agent | `~/.hermes/skills/<category>/<name>/` |

---

## 📚 فهرست اسکیل‌ها

| # | دسته | پوشه | تعداد |
|---|---|---|---|
| ۰۱ | 🧭 برنامه‌ریزی و طراحی راه‌حل | `01-planning` | ۶ |
| ۰۲ | 🤖 اجرای برنامه و مدیریت ایجنت‌ها | `02-agent-workflow` | ۶ |
| ۰۳ | 🧪 تست و دیباگ | `03-testing-debugging` | ۴ |
| ۰۴ | 🔍 بازبینی و کیفیت کد | `04-code-quality` | ۵ |
| ۰۵ | 🌿 گیت، همکاری و انتشار | `05-git-collaboration` | ۶ |
| ۰۶ | 🛡️ امنیت | `06-security` | ۶ |
| ۰۷ | 🎨 فرانت‌اند و طراحی | `07-frontend-design` | ۸ |
| ۰۸ | 🧰 زبان‌ها، فریم‌ورک‌ها و دیتابیس | `08-languages-frameworks` | ۴ |
| ۰۹ | 📝 مستندات و نوشتن | `09-docs-writing` | ۲ |
| ۱۰ | 🧠 اسکیل‌ها و ابزارهای هوش مصنوعی | `10-skills-and-ai-tools` | ۴ |

### ۰۱ — 🧭 برنامه‌ریزی و طراحی راه‌حل

| اسکیل | کاربرد | منبع |
|---|---|---|
| `brainstorming` | قبل از ساخت هر قابلیت جدید: سؤال پرسیدن، بررسی گزینه‌ها و رسیدن به طرح تأییدشده | [superpowers][sp] |
| `writing-plans` | تبدیل نیازمندی‌ها به برنامهٔ اجرایی دقیق و قدم‌به‌قدم، قبل از دست زدن به کد | [superpowers][sp] |
| `grilling` | سؤال‌پیچ کردن بی‌امان یک طرح یا تصمیم تا نقاط ضعفش پیدا شود | [Matt Pocock][mp] |
| `grill-me` | میان‌بر دستی برای شروع `grilling` | [Matt Pocock][mp] |
| `prototype` | ساخت نمونهٔ اولیهٔ دورریختنی برای جواب دادن به یک سؤال طراحی | [Matt Pocock][mp] |
| `research` | تحقیق از منابع معتبر اصلی و ذخیرهٔ نتیجه در یک فایل Markdown | [Matt Pocock][mp] |

### ۰۲ — 🤖 اجرای برنامه و مدیریت ایجنت‌ها

| اسکیل | کاربرد | منبع |
|---|---|---|
| `executing-plans` | اجرای قدم‌به‌قدم برنامهٔ نوشته‌شده توسط خود ایجنت | [superpowers][sp] |
| `subagent-driven-development` | سپردن هر وظیفهٔ برنامه به یک زیرایجنت جدا، با بازبینی بعد از هر مرحله | [superpowers][sp] |
| `requesting-code-review` | گرفتن بازبینی کد از یک زیرایجنت بازبین قبل از ادغام | [superpowers][sp] |
| `dispatching-parallel-agents` | تقسیم چند کار مستقل بین چند ایجنت موازی | [superpowers][sp] |
| `verification-before-completion` | اجرای واقعی تست‌ها و دیدن خروجی، قبل از اعلام «تمام شد» | [superpowers][sp] |
| `handoff` | خلاصه کردن گفتگو در یک سند تحویل برای ایجنت بعدی | [Matt Pocock][mp] |

> سه اسکیل اول به اسکریپت‌ها و فایل‌های همدیگر ارجاع می‌دهند، برای همین در یک دسته‌اند.

### ۰۳ — 🧪 تست و دیباگ

| اسکیل | کاربرد | منبع |
|---|---|---|
| `test-driven-development` | چرخهٔ TDD: اول تستی که شکست می‌خورد، بعد کد | [superpowers][sp] |
| `systematic-debugging` | پیدا کردن علت ریشه‌ای باگ قبل از هر اصلاحی | [superpowers][sp] |
| `webapp-testing` | تست وب‌اپ محلی با Playwright: کلیک، اسکرین‌شات، لاگ مرورگر | [Anthropic][an] |
| `property-based-testing` | تست‌های مبتنی بر ویژگی با Hypothesis، fast-check و ... | [Trail of Bits][tob] |

### ۰۴ — 🔍 بازبینی و کیفیت کد

| اسکیل | کاربرد | منبع |
|---|---|---|
| `code-review-checklist` | بازبینی ساختاریافتهٔ diff یا PR، به ترتیب شدت مشکل | این مخزن |
| `receiving-code-review` | برخورد درست با نظرات بازبینی: اول بررسی فنی، بعد اعمال | [superpowers][sp] |
| `refactoring` | بازآرایی امن کد در قدم‌های کوچک بدون تغییر رفتار | این مخزن |
| `codebase-design` | طراحی ماژول‌های «عمیق» با رابط ساده و قابل تست | [Matt Pocock][mp] |
| `improve-codebase-architecture` | پیدا کردن فرصت‌های بهبود معماری و ارائهٔ گزارش تصویری HTML | [Matt Pocock][mp] |

### ۰۵ — 🌿 گیت، همکاری و انتشار

| اسکیل | کاربرد | منبع |
|---|---|---|
| `git-commit-and-pr` | کامیت تمیز و توضیح مرتب برای Pull Request | این مخزن |
| `using-git-worktrees` | کار روی هر قابلیت در یک worktree جدا و ایزوله | [superpowers][sp] |
| `finishing-a-development-branch` | تصمیم برای ادغام، PR یا پاک‌سازی وقتی کار و تست‌ها تمام شد | [superpowers][sp] |
| `git-guardrails-claude-code` | هوک‌هایی در Claude Code که دستورهای خطرناک گیت را مسدود می‌کنند | [Matt Pocock][mp] |
| `setup-pre-commit` | راه‌اندازی Husky و lint-staged برای بررسی خودکار قبل از هر کامیت | [Matt Pocock][mp] |
| `open-sourcing` | آماده‌سازی مخزن برای عمومی شدن: مجوز، مستندات، نشت اطلاعات | [Trail of Bits][tob] |

### ۰۶ — 🛡️ امنیت

| اسکیل | کاربرد | منبع |
|---|---|---|
| `security-audit` | بازبینی امنیتی دفاعی: OWASP، رمزهای لو رفته، وابستگی‌ها | این مخزن |
| `differential-review` | بازبینی امنیتی تغییرات کد با سنجش دامنهٔ اثر هر تغییر | [Trail of Bits][tob] |
| `sharp-edges` | پیدا کردن APIها و تنظیماتی که راه اشتباه امنیتی را باز می‌گذارند | [Trail of Bits][tob] |
| `supply-chain-risk-auditor` | بررسی ریسک زنجیرهٔ تأمین: آسیب‌پذیری‌ها و پکیج‌های رهاشده | [Trail of Bits][tob] |
| `variant-analysis` | پیدا کردن نمونه‌های دیگرِ یک باگ در کل کد | [Trail of Bits][tob] |
| `semgrep` | اسکن امنیتی کد با Semgrep | [Trail of Bits][tob] |

### ۰۷ — 🎨 فرانت‌اند و طراحی

| اسکیل | کاربرد | منبع |
|---|---|---|
| `frontend-design` | طراحی بصری متمایز و حساب‌شده به‌جای قالب‌های تکراری | [Anthropic][an] |
| `accessibility-and-rtl` | دسترس‌پذیری (WCAG)، واکنش‌گرایی و راست‌به‌چپ برای فارسی و عربی | این مخزن |
| `web-design-guidelines` | بازبینی رابط کاربری بر اساس Web Interface Guidelines | [Vercel][vc] |
| `vercel-react-best-practices` | بهینه‌سازی عملکرد React و Next.js | [Vercel][vc] |
| `vercel-composition-patterns` | الگوهای مقیاس‌پذیر ترکیب کامپوننت در React | [Vercel][vc] |
| `theme-factory` | ۱۰ تم آماده (رنگ و فونت) برای اسلاید، سند و صفحهٔ وب | [Anthropic][an] |
| `web-artifacts-builder` | ساخت صفحه‌های HTML پیچیده با React، Tailwind و shadcn/ui | [Anthropic][an] |
| `algorithmic-art` | هنر الگوریتمی و مولد با p5.js | [Anthropic][an] |

### ۰۸ — 🧰 زبان‌ها، فریم‌ورک‌ها و دیتابیس

| اسکیل | کاربرد | منبع |
|---|---|---|
| `python-best-practices` | قواعد نوشتن و بازبینی پایتون مدرن | این مخزن |
| `modern-python` | راه‌اندازی پروژهٔ پایتون با ابزارهای مدرن (uv، ruff، ty) | [Trail of Bits][tob] |
| `supabase-postgres-best-practices` | بهترین روش‌های Postgres: جدول، ایندکس، کوئری و امنیت | [Supabase][sb] |
| `vercel-react-native-skills` | بهترین روش‌های React Native و Expo | [Vercel][vc] |

### ۰۹ — 📝 مستندات و نوشتن

| اسکیل | کاربرد | منبع |
|---|---|---|
| `documentation-writer` | نوشتن README و مستندات دقیق به فارسی و انگلیسی | این مخزن |
| `writing-for-agents` | نوشتن سند برای ایجنت‌ها: اسکیل، `AGENTS.md`، `CLAUDE.md` | [Matt Pocock][mp] |

### ۱۰ — 🧠 اسکیل‌ها و ابزارهای هوش مصنوعی

| اسکیل | کاربرد | منبع |
|---|---|---|
| `find-skills` | پیدا کردن و نصب اسکیل مناسب از اکوسیستم اسکیل‌ها | [Vercel][fs] |
| `skill-creator` | ساخت، بهبود و سنجش اسکیل جدید | [Anthropic][an] |
| `writing-skills` | نوشتن اسکیل و تست کردنش قبل از استفاده | [superpowers][sp] |
| `mcp-builder` | ساخت سرور MCP باکیفیت برای اتصال مدل به سرویس‌های دیگر | [Anthropic][an] |

### 💡 نکته‌ها

- بعضی اسکیل‌ها ابزار جانبی لازم دارند: `semgrep` به Semgrep، `webapp-testing` به Playwright پایتون، و `web-artifacts-builder` به Node.js.
- `git-guardrails-claude-code` مخصوص Claude Code است. `grill-me` و `handoff` فقط با فراخوانی دستی اجرا می‌شوند (مثلاً `/grill-me`).
- اسکیل‌ها روی سیستم شما اسکریپت اجرا می‌کنند؛ مثل هر کد دیگری، قبل از استفاده نگاهی به آن‌ها بیندازید.

---

## 🌍 اسکیل‌های بیشتر (فقط لینک)

این‌ها را کپی نکردم: یا مجوزشان اجازهٔ بازنشر نمی‌دهد، یا نصب جداگانه دارند، یا خیلی تخصصی‌اند.

| دسته | منبع | توضیح |
|---|---|---|
| اسناد آفیس | [docx][a-docx]، [pdf][a-pdf]، [pptx][a-pptx]، [xlsx][a-xlsx] | اسکیل‌های رسمی Anthropic برای Word، PDF، PowerPoint و Excel؛ مجوزشان متن‌باز نیست، پس فقط لینک شده‌اند |
| اسناد | [doc-coauthoring][a-doc] | نوشتن مشترک سند؛ مجوز مشخصی ندارد |
| طراحی | [canvas-design][a-canvas] | طراحی پوستر و اثر هنری در PNG و PDF |
| Claude API | [claude-api][a-api] | مرجع API کلاد؛ در Claude Code از قبل وجود دارد |
| مجموعهٔ کامل | [superpowers][sp] | نصب کامل به‌شکل پلاگین، همراه فعال‌سازی خودکار اسکیل‌ها |
| جریان کار مهندسی | [mattpocock/skills][mp] | `to-spec`، `to-tickets`، `triage`، `wayfinder` (نیاز به `setup-matt-pocock-skills`) |
| امنیت تخصصی | [trailofbits/skills][tob] | قراردادهای هوشمند، فازینگ، رمزنگاری، CodeQL |
| استقرار | [vercel-labs/agent-skills][vc] | `deploy-to-vercel`، `vercel-optimize` |
| Supabase | [supabase/agent-skills][sb] | اسکیل کامل کار با Supabase |
| Hermes | [Skills Hub][hermes] | صدها اسکیل جامعه برای Hermes Agent |
| OpenCode | [مستندات اسکیل][opencode] | ساخت و مدیریت اسکیل در OpenCode |
| فهرست‌های بزرگ | [travisvn][aw1]، [ComposioHQ][aw2]، [VoltAgent][aw3] | فهرست‌های گزینش‌شده با صدها تا هزاران اسکیل |

---

## 🔄 به‌روزرسانی

</div>

```bash
git pull
```

<div dir="rtl">

برای نگه‌دارندهٔ مخزن: اسکیل‌های منابع بیرونی در `upstream.tsv` ثبت شده‌اند. این دستور همه را از آخرین نسخهٔ منبع دوباره کپی می‌کند و `THIRD_PARTY_NOTICES.md` را می‌سازد:

</div>

```bash
scripts/sync-upstream.sh && scripts/validate.sh
```

<div dir="rtl">

## ✍️ افزودن اسکیل جدید

۱. پوشه‌ای در `skills/<دسته>/` بسازید که نامش با `name` در frontmatter یکی باشد.
۲. فایل `SKILL.md` را با این قالب بنویسید و `scripts/validate.sh` را اجرا کنید.

</div>

```markdown
---
name: my-skill
description: What it does and WHEN to use it (1-1024 characters).
license: MIT
---

# My Skill
Step-by-step instructions for the agent...
```

<div dir="rtl">

- `description` مهم‌ترین بخش است؛ ایجنت بر اساس آن تصمیم می‌گیرد کی اسکیل را بارگذاری کند.
- نام فقط حروف کوچک انگلیسی، عدد و خط تیره، و حداکثر ۶۴ حرف.
- فایل‌های کمکی را در `scripts/`، `references/` و `assets/` کنار `SKILL.md` بگذارید.
- از نام‌های تکراری با اسکیل‌های داخلی ابزارها (مثل `code-review` یا `init` در Claude Code) پرهیز کنید.

## 📄 مجوز

- اسکیل‌ها و اسکریپت‌های نوشته‌شده در این مخزن: [MIT](LICENSE).
- اسکیل‌های منابع دیگر بدون تغییر کپی شده‌اند و مجوز خودشان را دارند (MIT، Apache-2.0 یا CC-BY-SA-4.0). فایل مجوز هر کدام داخل پوشه‌اش است و فهرست کامل با commit دقیق در [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) آمده است.

</div>

[an]: https://github.com/anthropics/skills
[sp]: https://github.com/obra/superpowers
[mp]: https://github.com/mattpocock/skills
[tob]: https://github.com/trailofbits/skills
[vc]: https://github.com/vercel-labs/agent-skills
[fs]: https://github.com/vercel-labs/skills
[sb]: https://github.com/supabase/agent-skills
[a-docx]: https://github.com/anthropics/skills/tree/main/skills/docx
[a-pdf]: https://github.com/anthropics/skills/tree/main/skills/pdf
[a-pptx]: https://github.com/anthropics/skills/tree/main/skills/pptx
[a-xlsx]: https://github.com/anthropics/skills/tree/main/skills/xlsx
[a-doc]: https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring
[a-canvas]: https://github.com/anthropics/skills/tree/main/skills/canvas-design
[a-api]: https://github.com/anthropics/skills/tree/main/skills/claude-api
[hermes]: https://hermes-agent.nousresearch.com/docs/guides/work-with-skills
[opencode]: https://opencode.ai/docs/skills
[aw1]: https://github.com/travisvn/awesome-claude-skills
[aw2]: https://github.com/ComposioHQ/awesome-claude-skills
[aw3]: https://github.com/VoltAgent/awesome-agent-skills
