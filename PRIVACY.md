# Partner Copilot and your data

Partner Copilot runs on your computer. It has no server of its own and no analytics, and it sends
nothing to its author. What it gathers stays on your computer; what Claude needs for a deep dive or
an answer goes to Anthropic through your own Claude Code, as in any of your Claude Code sessions.

## What's stored, and where

| Place | What's there | How long |
| --- | --- | --- |
| Chrome's extension storage (on your disk, in your Chrome profile; not the cache) | Partners, briefs, deep dives, chats, notes, next steps, people cards, the schedule, your background, settings | Until you clear it, or remove the extension |
| `~/Partner Copilot/Backups/` | A backup a minute after each change (one file a day), plus one set aside before a restore, and before a change removes partners, deep dives, notes, people you looked up, or part of the schedule or your background (the day's first change too) | The newest 7 days and 10 set-aside backups |
| `~/Partner Copilot/Partners/<Company>/` | `deep-dive.md`, `notes.md` (with your next step), `people.md` (the people you looked up), and one `chat-<date>-<time>.md` per conversation, named by when it started, in your time zone | Kept, even after Clear all: delete them yourself |
| `~/.gauntlet-copilot/` | The helper (`app/`), the extension folder you loaded (`extension/`), the helper's settings with its pairing token, and its log | Until you remove the folder |
| `~/.gauntlet-copilot/results/` | Each deep dive, Redo and look-up of people as it finished, so a panel closed mid-run saves it when you reopen it. Readable by you only | 7 days, even after Clear all |
| `~/.claude/projects/<…gauntlet-copilot-workspace>/` | Claude Code's session for each deep dive and chat | The ones nothing uses any more are cleaned up; Claude Code also deletes any older than 30 days |

- **Kept lean.** Each PDF keeps the 25,000 characters a deep dive can use, and each chat its latest
  200 messages; the Claude Code session holds the whole conversation. Redo runs, look-ups of people
  and the sign-in check leave no session behind. Options › Your data shows the sizes.
- **Not in backups:** the helper's pairing token and the access tokens in brief attachment links.
  The schedule keeps what was read (each day's partners, logistics and notes, your own slots, and
  who attends for each partner), never the pasted text, which lists other challengers.
- **Restore** (Options › Your data) replaces what's in this browser with a backup, after setting
  aside what's there. A backup from an older version is brought up to date as it's restored; one
  from a newer version isn't restored until you update. To undo **Clear**, **Clear all**,
  **Clear notes**, **Clear schedule**, **Clear background**, **Delete deep dive**, **Remove** on
  someone you looked up, **Remove day** or **Replace schedule**, restore the one listed "before
  something was removed" from just before it (if there's none, the last daily backup before it).
- **Another folder for backups:** set `GAUNTLET_COPILOT_BACKUP_DIR` to a full path in your shell's
  profile (so updates keep it), open a new terminal, and run the install line again. The default is
  in your home folder rather than Documents, so macOS doesn't ask for access and your resume and
  notes aren't synced to iCloud or OneDrive unless you choose a folder that is.

## What goes to Anthropic

Deep dives, Ask and looking people up run through Claude Code, signed in with your own Claude
account, so what they're given goes to Anthropic as part of your Claude Code sessions:

- the portal's facts about the partner, and its project brief with its PDFs' text;
- your background: your projects from My projects, your resume's text, your links and About you;
- your notes on the partner (debriefs included) and your next step;
- what you ask on the Ask tab, and the people cards you looked up, which Ask and deep dives are
  given;
- where you are in the program: the week, the partner's event day (and the last one you met them
  at, once it's over), your own slot, who attends for the partner, and the day's logistics.

Nothing else does: not the schedule text you paste (it isn't kept), nor other challengers' names
from an interview sheet. People are looked up only when you click **Look up** or **Refresh** on the People
tab, and only the partner's portal facts, their names and when you meet go in, never your
background. Files never leave the browser, only their text: your resume, and the brief's PDFs,
whose download links carry access tokens and stay in the browser.

**Open in claude.ai**, on the Deep dive tab, is the one other way: only when you click it, it opens
claude.ai with the same research brief a deep dive is given (the portal's facts, the project brief,
your background, your notes, when you meet the partner and the people you looked up)
filled in or on your clipboard, for your claude.ai account.

## Nothing else leaves your computer

- No analytics, no tracking, and no check for updates: installing or updating downloads from
  GitHub, and that's all.
- The extension reads the portal as you, signed in, and the brief attachments the portal keeps on
  `firebasestorage.googleapis.com` (its permission for that site is how it reads them: the portal
  page itself can't). It talks to nothing else but the helper on your computer.
- Claude Code searches the web and reads pages for the research, as in any of your sessions.
- **Share with a friend** saves a file in your downloads, and nothing is sent anywhere: you choose
  whom to give it to. See [Sharing a deep dive](#sharing-a-deep-dive) for what it leaves out.

## Sharing a deep dive

**Share with a friend**, on the Deep dive tab, saves the company research as a file
(`<partner>.partner-copilot.json`) to give another Gauntlet engineer.

- Fit with your projects, Interview prep and The partner project stay with you, as do your notes,
  chat, people and next steps.
- So does any other section (or the caveats) that names you, your links, your resume's file name,
  one of your projects or someone you're meeting there, that links one of a brief's own links
  (shared docs can be private; the partner's own site is public), or that repeats about 8 words in
  a row of your notes, your next step, a brief, your resume or About you.
- Sources and stats from a brief's links or under your links, or that name you or someone you're
  meeting, are left out too.
- The notice lists exactly which sections the file has. The check for what mentions you is careful
  but not perfect, so look over those sections before you send it.

## How it's kept safe

- **The helper only accepts your extension.** It listens on 127.0.0.1 only and needs the pairing
  token. It checks the Host header (against DNS rebinding), refuses web-page origins, and accepts
  only the extension it's paired with. The token reaches the extension through Chrome's native
  messaging, which Chrome allows only for this extension's fixed ID (the `key` in its manifest).
- **Claude Code gets only web search and web fetch.** It has no shell, no files and no MCP servers,
  and runs with `--safe-mode`, so your CLAUDE.md, hooks and plugins aren't loaded. Pages it reads
  are data, and an injected instruction has nothing else to reach.
- **Runs use your plan, never an API key.** The helper removes `ANTHROPIC_API_KEY` and
  `ANTHROPIC_AUTH_TOKEN` from Claude Code's environment.
- **Web content is sanitised.** Everything Claude writes is rendered through DOMPurify. Images,
  styles, forms and non-http links are dropped.
- **A friend's deep dive is data.** The prompts give it to Claude as another engineer's work (data,
  not instructions), never as its own earlier research.

## Delete everything

1. On `chrome://extensions`, click **Remove** on Partner Copilot. That deletes what it saved in
   Chrome. (To empty it but keep the extension, use **Clear all** in Options › Your data.)
2. Remove the helper, its settings and the results it kept:
   ```sh
   node ~/.gauntlet-copilot/app/cli.js uninstall && rm -rf ~/.gauntlet-copilot
   ```
3. Remove your backups and the Markdown copies:
   ```sh
   rm -rf ~/"Partner Copilot"
   ```
4. Remove Claude Code's sessions for Partner Copilot:
   ```sh
   rm -rf ~/.claude/projects/*gauntlet-copilot-workspace
   ```
5. Anything you saved with **Export .md** or **Share with a friend** is in your downloads.
