---
name: accessibility-and-rtl
description: Make web UIs accessible (WCAG 2.2 AA), responsive, and correct in right-to-left languages such as Persian and Arabic. Use when building or reviewing UI, forms, or layouts, and always when the interface contains RTL text.
license: MIT
---

# Accessibility and RTL

Pair this with a visual-direction skill such as `frontend-design`: that one decides how the UI looks; this one makes sure everyone can use it, in either text direction.

## 1. Semantics and keyboard
- Use native elements: `button`, `a href`, `label` + `input`, `nav`, `main`, `header`, `footer`, and headings in order (h1 → h2 → h3).
- Every interactive element is reachable with Tab, works with Enter/Space, and shows a visible `:focus-visible` style.
- Dialogs move focus inside, keep it there, close on `Esc`, and return focus to the opener.
- Icon-only buttons get an `aria-label`. Decorative images get `alt=""`; informative images get real alt text.
- Use ARIA only when no native element fits, and never add a `role` an element already has.

## 2. Contrast, color and motion
- Text contrast at least 4.5:1 (3:1 for text 24px and up, or bold 18.7px and up). Component borders and focus rings at least 3:1.
- Never use color alone to carry meaning; add an icon, text, or pattern.
- Respect `prefers-reduced-motion` and `prefers-color-scheme`, and check both themes.

## 3. Forms
- A visible label for every field (a placeholder is not a label). Group related fields with `fieldset` and `legend`.
- Errors appear as text next to the field, are linked with `aria-describedby`, are announced (`aria-live="polite"`), and are not shown by color only.
- Set the right `type`, `inputmode`, and `autocomplete` on inputs.

## 4. Responsive layout
- Mobile first. Check 320px, 768px, 1280px, and 200% browser zoom: no horizontal scroll and no clipped text.
- Touch targets at least 24×24px (44×44px preferred).
- Use `rem` for font sizes so the user's font-size setting works.

## 5. Right-to-left (Persian, Arabic, Hebrew, Urdu)
- Set `<html lang="fa" dir="rtl">` (with the right language code). Use `dir="auto"` on user-generated content.
- Use CSS logical properties: `margin-inline-start`, `padding-inline-end`, `inset-inline-start`, `border-start-start-radius`, `text-align: start`. Never hard-code `left`/`right` for layout.
- Flexbox and grid already follow `dir`; don't "fix" them with `row-reverse`.
- Mirror direction-bearing icons (back/forward arrows, chevrons, progress) with `:dir(rtl) .icon { transform: scaleX(-1); }`. Don't mirror logos, checkmarks, or the media play icon.
- Keep code, URLs, emails, phone numbers, and numbers with units left-to-right by wrapping them in `<bdi>` or `<span dir="ltr">`.
- Pick one digit style (Persian ۰-۹ or Latin 0-9) and format with `Intl.NumberFormat('fa-IR')`. Format dates with `Intl.DateTimeFormat('fa-IR-u-ca-persian')` for the Solar Hijri calendar.
- Use a font with proper Persian glyphs (for example Vazirmatn). Test the ی/ي and ک/ك variants and the zero-width non-joiner (ZWNJ, U+200C) in words like «می‌شود».
- Test mixed-direction strings, such as a Persian sentence that contains an English word and a number.

## 6. Verify
- Go through the whole flow with the keyboard only.
- Smoke-test with a screen reader (VoiceOver or NVDA): headings, landmarks, form errors.
- Run an automated check: axe DevTools, `npx @axe-core/cli <url>`, or Lighthouse (accessibility score 95 or higher).
- Look at every screen in RTL and LTR, at mobile and desktop widths.

## Reporting (when reviewing)
One line per issue, most severe first: `[severity] file:line — problem — who it affects — fix`.
