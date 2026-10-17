# Partner Copilot and your data

Partner Copilot runs on your computer. It has no server of its own and no analytics, and it sends
nothing to its author. What it gathers stays on your computer; what Claude needs for a deep dive or
an answer goes to Anthropic through your own Claude Code, as in any of your Claude Code sessions.

## What's stored, and where

The paths are a Mac's and Linux's. On Windows, `~` is your profile folder, `%USERPROFILE%`
(`C:\Users\<you>`), so `~/.gauntlet-copilot/` is `%USERPROFILE%\.gauntlet-copilot\`.

| Place | What's there | How long |
| --- | --- | --- |
| Chrome's extension storage (on your disk, in your Chrome profile; not the cache) | Partners, briefs, deep dives, chats, notes, your conversations with each partner (debriefs, ratings, next steps, when you sent a thank-you), meetings you planned, your calendar's events (and its secret link, if you gave one), your Want / Maybe marks, the partners you closed out (why, your note, how their slots show), the partner projects you started (each one's folder and due date), people cards, the schedule, your background (with the docs read from your repos), settings | Until you clear it, or remove the extension |
| `~/Partner Copilot/Backups/` | A backup a minute after each change (one file a day), plus one set aside before a restore, and before a change removes partners, deep dives, notes, people you looked up, or part of the schedule or your background (the day's first change too) | The newest 7 days and 10 set-aside backups |
| `~/Partner Copilot/Partners/<Company>/` | `deep-dive.md`, `notes.md` (with your mark, your next step and the day you sent a thank-you), `people.md` (the people you looked up), and one `chat-<date>-<time>.md` per conversation, named by when it started, in your time zone | Kept, even after Clear all: delete them yourself |
| `~/Partner Copilot/Projects/<Company> - <Project>/` (or the folder you chose) | Written when you click **Write the project folder** on a partner's Project tab: `README.md` (once, then yours), `CLAUDE.md`, and in `docs/` the brief, the text of its attached files, and the deep dive's partner project, fit and engineering sections with your notes on the partner. **Write again** rewrites only the files Partner Copilot wrote | Kept, even after Clear all: it's your project |
| `~/.gauntlet-copilot/` | The helper (`app/`), the extension folder you loaded (`extension/`), the helper's settings (its pairing token, and the newest version it heard of), its log, and the launcher your browser runs to start it (on Windows, with the manifest the registry names) | Until you remove the folder |
| The registry, on Windows only: `HKCU\Software\<Browser>\NativeMessagingHosts\com.gauntlet.partner_copilot` | One key per browser the install found (Chrome, Chromium, Edge, Brave, Vivaldi), holding the path of that manifest: how the browser knows it may start the helper. In your own part of the registry, never the computer's | Until you uninstall |
| `~/.gauntlet-copilot/results/` | Each deep dive, Redo and look-up of people as it finished, so a panel closed mid-run saves it when you reopen it. Readable by you only | 7 days, even after Clear all |
| Your computer's temp folder (`gpc-repo-…`) | A repo while its docs are read: its file list, and the contents of those docs only | Removed as soon as they're read |
| `~/.claude/projects/<…gauntlet-copilot-workspace>/` | Claude Code's session for each deep dive and chat | The ones nothing uses any more are cleaned up; Claude Code also deletes any older than 30 days |

- **Kept lean.** Each attached file keeps the 25,000 characters a deep dive can use, and each chat
  its latest 200 messages; the Claude Code session holds the whole conversation. Redo runs,
  look-ups of people and the sign-in check leave no session behind. Options › Your data shows the
  sizes.
- **Not in backups:** the helper's pairing token, the access tokens in brief attachment links, and
  your calendar (its events and its secret link): import it again after a restore.
  The schedule keeps what was read (each day's partners, logistics and notes, your own slots, and
  who attends for each partner), never the pasted text, which lists other challengers.
- **Restore** (Options › Your data) replaces what's in this browser with a backup, after setting
  aside what's there. A backup from an older version is brought up to date as it's restored; one
  from a newer version isn't restored until you update. To undo **Forget** (a partner), **Clear
  all**, **Clear notes**, **Clear schedule**, **Clear background**, **Delete deep dive**, **Remove**
  on someone you looked up, **Remove day** or **Replace schedule**, restore the one listed "before
  something was removed" from just before it (if there's none, the last daily backup before it).
- **Another folder for backups:** set `GAUNTLET_COPILOT_BACKUP_DIR` to a full path in your shell's
  profile (so updates keep it), open a new terminal, and run the install line again. On Windows,
  make it a user environment variable instead: in PowerShell,
  `[Environment]::SetEnvironmentVariable('GAUNTLET_COPILOT_BACKUP_DIR', 'D:\Backups', 'User')`,
  then open a new PowerShell and run the install line again. The default is in your home folder
  rather than Documents, so macOS doesn't ask for access and your resume and notes aren't synced to
  iCloud or OneDrive unless you choose a folder that is.

## What goes to Anthropic

Deep dives, Ask and looking people up run through Claude Code, signed in with your own Claude
account, so what they're given goes to Anthropic as part of your Claude Code sessions:

- the portal's facts about the partner, and its project brief with the text of its attached files
  (PDF, Word or text);
- your background: your projects from My projects with the READMEs and design docs read from their
  repos (the ones you leave checked under You), your resume's text, your links and About you;
- your notes on the partner (debriefs included), your last few conversations with it (when, what
  kind, with whom, your rating and next step), your 1–5 rating of a meeting, your next step, the
  day you sent a thank-you (so Ask doesn't draft another), whether you marked it Want or Maybe, or
  closed it out and why, with your note (one sentence, so the advice fits), when the partner project you started is due and when you
  started it, and how its last check against the brief came out;
- what you ask on the Ask tab, and the people cards you looked up, which Ask and deep dives are
  given;
- where you are in the program: the week, the partner's event day (and the last one you met them
  at, once it's over), your own slot, who attends for the partner, and the day's logistics.

**Check against the brief** runs Claude Code in the project's folder, so what it reads there goes
to Anthropic too, as in any Claude Code session you'd run in that folder: `docs/` (the brief, its
files' text, your partner notes) and the code it looks at. It can only read (Read, Glob and Grep:
nothing runs, nothing is changed), and only in a folder **Start the project** wrote.

**Rank my partners** sends, for each partner you've met or marked: its name and tier, your mark,
your rating, when you last met, the start of your notes (your debriefs first), the start of the
deep dive's fit and how your project with it stands, and what you said matters most to you, if
you did. It runs with no tools.

Nothing else does: not your calendar (no titles, no times, not even that you're busy), not the
schedule text you paste (it isn't kept), nor other challengers' names
from an interview sheet. People are looked up only when you click **Look up** or **Refresh** on the
People tab, or **Start** under **Prepare this day** with **Also look up who you're meeting** ticked,
and only the partner's portal facts, their names and when you meet go in, never your background.
Files never leave the browser, only their text: your resume, the schedule file you import (the
.xlsx Gauntlet sends, a PDF or text, read in the browser; only what's read from it is kept, as from
a paste, never the file or other challengers' names), and the brief's attached files (PDF,
Word or text, each read in the browser), whose download links carry access tokens and stay in the
browser. Starting a project writes that text, never the files or their links, to the project's
folder on your computer, and sends nothing to Claude: the folder is for your own Claude Code
sessions. A file that can't be read (an old Word .doc, a scanned PDF) adds nothing to the brief:
none of its contents go to Claude.

**Open in claude.ai**, on the Deep dive tab, is the one other way: only when you click it, it opens
claude.ai with the same research brief a deep dive is given (the portal's facts, the project brief,
your background, your notes, when you meet the partner, your mark on it and the people you looked
up) filled in or on your clipboard, for your claude.ai account.

## Nothing else leaves your computer

- No analytics and no tracking. Once a day, the helper asks GitHub which version of Partner Copilot
  is the newest, so the panel can say when one is out: one request to `api.github.com`, like
  opening the releases page, with nothing about you or your data in it (only which version is
  asking). To turn that off, set `GAUNTLET_COPILOT_NO_UPDATE_CHECK=1` in your shell's profile, open
  a new terminal, and run the install line again (on Windows, as a user environment variable, the
  way the backup folder is set above). Installing or updating downloads from GitHub, and that's all.
- The extension reads the portal as you, signed in, and the brief attachments the portal keeps on
  `firebasestorage.googleapis.com` (its permission for that site is how it reads them: the portal
  page itself can't). It talks to nothing else but the helper on your computer.
- Claude Code searches the web and reads pages for the research, as in any of your sessions.
- **Your repos' docs** are read by the helper with git, signed in as you are in a terminal (your
  credential helper or SSH key), from where your repos are (GitHub, your company's GitLab): only
  the repos your projects on My projects link, after a sync finds one not read yet, or when you
  click **Read docs** or **Refresh docs** under You. Only the README and the design docs are
  downloaded.
- **It's an interview…** copies one of your calendar's events (its day, time, length, title and
  place, as you check them in the form) into a meeting you planned with a partner, once you click
  **Plan it**. From then on it's a planned meeting like any other, so the deep dives and Ask hear
  about it as they do your slots. Your calendar's other events still go nowhere.
- **Your calendar's secret link**, if you gave one, is read by the helper every 30 minutes (and
  when the panel opens): one request to that link, from your computer, as your calendar app would
  make. Only an https:// (or webcal://) link to a public address is read, never one on your
  computer or its network (checked as it connects, redirects too), at most 5 MB in 15 seconds. The
  helper keeps nothing and logs only its size, never the link. **Remove** in Options › Your
  calendar forgets the link and its events.
- **Share with a friend** saves a file in your downloads, and nothing is sent anywhere: you choose
  whom to give it to. See [Sharing a deep dive](#sharing-a-deep-dive) for what it leaves out.
- **Log on the portal** fills a card on the portal's Partner interactions page in your browser,
  as you'd type it: your debrief and your rating (and, for a partner not tracked there yet, picks
  it and clicks **+ Add**). It never clicks **Add entry**: nothing goes to the portal until you do.
  What you add is then on the portal, as anything you log there is.
- **Add to calendar (.ics)** and **Export .md** save a file in your downloads too, and send nothing.
  The calendar file holds your interviews that day, each with its cheat sheet (who you're meeting
  and what you looked up about them, your project to lead with, your prep and questions, the first
  line of your notes) and the sheet's note on the partner; on a day you have no interview on, the
  day's logistics and partners. Once you import it, that's in your calendar, wherever it keeps it,
  and its reminders are your calendar's own.

## Sharing a deep dive

**Share with a friend**, on the Deep dive tab, saves the company research as a file
(`<partner>.partner-copilot.json`) to give another Gauntlet engineer.

- Fit with your projects, Interview prep and The partner project stay with you, as do your notes,
  chat, people, next steps and marks.
- So does any other section (or the caveats) that names you, your links, your resume's file name,
  one of your projects or someone you're meeting there, that links one of a brief's own links
  (shared docs can be private; the partner's own site is public), or that repeats about 8 words in
  a row of your notes, your next step, a brief, your resume, About you or a doc read from your repos.
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
- **Git only reads your repos' docs.** The helper runs git with arguments, never a shell, for
  https:// and SSH links only. It never asks for a password (a repo your sign-in can't read says
  so instead), it stops after 30 seconds, and nothing in the repo runs.
- **Runs use your plan, never an API key.** The helper removes `ANTHROPIC_API_KEY` and
  `ANTHROPIC_AUTH_TOKEN` from Claude Code's environment. **Prepare this day** says how many deep
  dives it will run or refresh, and about how long, before it starts any; the helper runs two at a
  time and queues the rest.
- **Catch someone up** is made in your browser from what's saved, with no Claude run, and goes only
  where you send it. It never carries your notes beyond the start of each debrief, Ask, the deep
  dives' fit, risks or interview prep, your calendar, or other challengers; the people you met are
  named by their role unless you choose otherwise. The mentor version names them by default (it's
  for Gauntlet) and has longer debrief excerpts, still never your other notes, Ask or your calendar.
- **Interview mode** keeps what's private off the screen: while it's on, the panel never draws
  your marks, ratings, ranking, notes, conversations, the Ask tab, the deep dive's risks or your
  calendar's titles, and nothing on screen says it's on.
- **Permissions.** 0.6.0 adds `contextMenus`, for the toolbar icon's right-click menu (Log a
  conversation, Interview mode). Chrome shows no new warning for it.
- **Web content is sanitised.** Everything Claude writes is rendered through DOMPurify. Images,
  styles, forms and non-http links are dropped.
- **A friend's deep dive is data.** The prompts give it to Claude as another engineer's work (data,
  not instructions), never as its own earlier research.
- **A project's folder says its docs are data.** Your own Claude Code runs there with its usual
  tools, so the folder's `CLAUDE.md` tells it that `docs/` (what the partner wrote and what research
  found) is requirements to build from, not instructions to follow without asking you.

## Delete everything

1. On `chrome://extensions`, click **Remove** on Partner Copilot. That deletes what it saved in
   Chrome. (To empty it but keep the extension, use **Clear all** in Options › Your data.)
2. Remove the helper, its settings and the results it kept (on Windows, `uninstall` also removes
   its registry keys):
   ```sh
   node ~/.gauntlet-copilot/app/cli.js uninstall && rm -rf ~/.gauntlet-copilot
   ```
3. Remove your backups and the Markdown copies (this removes the project folders you started in
   `Projects` too, with your work in them: move any you want to keep first):
   ```sh
   rm -rf ~/"Partner Copilot"
   ```
4. Remove Claude Code's sessions for Partner Copilot:
   ```sh
   rm -rf ~/.claude/projects/*gauntlet-copilot-workspace
   ```
5. Anything you saved with **Export .md**, **Add to calendar (.ics)** or **Share with a friend** is
   in your downloads.

On Windows, steps 2 to 4 in PowerShell:

```powershell
node "$env:USERPROFILE\.gauntlet-copilot\app\cli.js" uninstall
if ($LASTEXITCODE -eq 0) { Remove-Item -LiteralPath "$env:USERPROFILE\.gauntlet-copilot" -Recurse -Force }
Remove-Item -LiteralPath "$env:USERPROFILE\Partner Copilot" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\.claude\projects\*gauntlet-copilot-workspace" -Recurse -Force
```
