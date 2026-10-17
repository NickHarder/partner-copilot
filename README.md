# Partner Copilot

A side panel for the [Gauntlet portal](https://portal.gauntletai.com) in Chrome, for challengers
meeting hiring partners. Click **Company info** on a partner and it writes a cited deep dive on the
company, then answers your questions about it. It keeps your schedule, who you're meeting and your
notes, so each answer prepares you for your next meeting. It runs on your computer, on your own
Claude plan through Claude Code: there's no API key and nothing to pay beyond your plan.

Not affiliated with, endorsed by or supported by Gauntlet AI.

## What it does

- **A partner's tabs: Deep dive, Ask, People, Company and Project.** The deep dive starts with
  what's for your interview (interview prep, how your projects fit, the partner project), then
  covers the company: funding, product, leadership, tech stack, news and risks, with sources. Your
  notes are at the top, and **⋯ More** has Export .md, Open in claude.ai and the deletes. Ask takes
  follow-up questions, can search the web again, and has **Copy** on each answer. People looks up
  who you're meeting, a card each. Company is what the portal's profile says, and Project is the
  project brief with its attached files: PDF, Word (.docx) and text files are read in your browser
  (an old Word .doc or other Office file can't be: its row says to ask the partner for a PDF or
  .docx). Under the partner's name, **Want · Maybe · Pass** marks where it stands with you (click
  the one that's on to clear it); the board and the prompts follow.
- **You.** Your name as interview sheets list it, your resume, links, a note about you, and your
  projects from My projects, in one place. Deep dives and Ask use them, with the README and design
  docs of each project's repo, read with your own git sign-in (so a private repo works too). You
  choose which docs go in.
- **Home.** Your next event day: your interviews by time and room, each with what's ready for it
  (**Brief ✓**, **Deep dive ✓**, **Prep ✓**, who you're meeting, **✎ Notes**). **Prep ✓**
  opens straight to the interview prep. Each slot has a **Cheat sheet** made from what's saved (who
  attends with what you looked up about them, your project to lead with, the start of the interview
  prep and its questions, your notes) to **Copy** or **Print** (it prints alone, on one page), so
  you can print it the evening before. On the day, the slot that's on is marked **Now · ends 4:15
  PM** and the one after it **Next · in 12 min**. Above it, **After your interviews** lists each
  debrief, thank-you to send or next step waiting on you. Below it, a board of your partners: first
  the ones waiting on you after a meeting, then by when you meet each one, the ones you marked
  **Want** first on their day. A **Want** filter lists your first choices; a partner marked **Pass**
  sinks to the bottom, greyed, and shows under **All** only. **Add to calendar (.ics)** under a day
  saves it for your own calendar: an event per interview of yours, with its cheat sheet and a
  reminder 10 minutes before (a day you have no interview on is one all-day event with its
  partners). **Prepare this day** reads the day's partners not read yet from the portal, runs each
  missing deep dive and refreshes each out-of-date one (as its **Refresh** does), two at a time,
  after saying how many and about how long, from your plan. Looking up who you're meeting is a box
  you tick; a partner you marked Pass is left out.
- **A deep dive takes a few minutes.** Meanwhile its board row says **Researching…** with the
  time so far, and the toolbar icon shows **…**, then **✓** (or **!** if it stopped) until you
  open it, even if you closed the panel.
- **Start the partner project.** On the Project tab, **Write the project folder** makes a folder
  to build it in with Claude Code, `~/Partner Copilot/Projects/<Company> - <Project>` unless you
  choose another: the brief, the text of its attached files and your partner notes (the deep dive
  on the project, how your projects fit, their engineering, your notes) in `docs/`, a `README.md`
  that's yours to edit, and a `CLAUDE.md` that has Claude Code read `docs/` first. Run `claude` in
  it. The board and the partner's header then say **Project due Fri, Oct 23 · in 2 days**, and Ask
  knows when it's due. **Write again** brings `docs/` and `CLAUDE.md` up to date and never
  touches your README; **Change folder** writes it somewhere else. **Check against the brief**
  has Claude Code read the folder (it can only read: nothing runs and nothing changes) and list
  each requirement of the brief and its files as done, partial, missing or at risk, with where in
  the code and why, then what to do next.
- **Log any conversation, when it happens.** An interview, a chat at the bar, coffee before your
  slot, a call: **Log a conversation** on a partner's Deep dive (or **Alt+Shift+L** anywhere, which
  asks which partner on home) takes when, what kind, with whom and where, then your debrief, a 1–5
  rating if you like, and a next step, with a due date if you like, that the board reminds you of.
  Your slot has **Debrief now** from the moment it starts, and **How did it go?** asks after it,
  until it's debriefed. Each partner's **Conversations** list them newest first, with **Edit** and
  **Delete** (your notes follow), and each person you met says when you last talked. **Plan a
  meeting** puts one you set up (coffee, a call) on your day, and asks how it went after it.
  **Log on the
  portal** fills the partner's card on the portal's Partner interactions page with your debrief
  and rating (adding the partner there first if it isn't tracked yet), and stops: you read it and
  click **Add entry** yourself, then **Logged ✓**. **Draft a thank-you** writes a note to the
  people you met, and home reminds you to send one after your interviews until you click
  **Sent ✓** (Ask is told, so it doesn't draft another).
- **Your calendar beside your days.** In Options › Your calendar, import an .ics file or paste
  your calendar's secret iCal link (Google's "Secret address in iCal format", or Outlook's or
  Apple's), read again every 30 minutes. Its events show grey between your slots on Your day, and
  a slot that overlaps one says **⚠ Overlaps Dentist, 10:00–10:45**. It stays in this browser and
  never goes to Claude. An interview that's only in your calendar (set up by email, say) becomes one
  of your slots with **It's an interview…** on its event (pick the partner), or, on the partner's
  **Plan a meeting**, **From your calendar** on a day the schedule doesn't have: check what's
  filled in, **Plan it**.
- **Interview mode, safe on screen, and it doesn't say so.** If the panel is open in an
  interview, it shows only what's about the company and reads as keen: **Partners I'm most
  excited about** (the partner you're meeting first, with a ★, then up to 3 you marked Want), who
  you're meeting and the questions to ask them, **My questions** from the interview prep (never
  its red flags), the deep dive's company sections, and **Culture & company**. Nothing on screen
  names the mode. Your marks, ratings, ranking, notes, conversations, the Ask tab, risks and your
  calendar's titles are hidden. It turns itself on from 10 minutes before each of your slots until
  it ends, and opens that slot's partner even if you were on another (Options › Program can turn
  that off). **Alt+Shift+I**, the toolbar icon's right-click menu, or **⋯** at the top right
  (**Interview mode** / **Show everything**) switch it by hand. Turned off during a slot, it stays
  off for that slot.
- **Rank my partners**, under the board: one order of the partners you've met or marked, best
  first, each with a line saying why, from your marks, ratings, debriefs, notes, the deep dives' fit
  and your projects. Move them up or down, then **Copy** the list for the program's ranking form.
- **Catch someone up**, under the board: an update for someone at home who isn't in the program,
  or (**My Gauntlet mentor**) one for your mentor check-in: where your head's at, your ranking and
  why, the interviews coming up and which round each is, your notes from each conversation (rating,
  debrief, next step, thank-you sent, logged on the portal), your partner projects and how their
  check against the brief stands, and who you passed on, with no company recaps.
  For someone at home:
  It has where things stand, your ranking with its reasons, how each interview went (your rating and
  the start of your debrief), what's coming up, where each job would be (remote, hybrid or on site,
  and the city) and each company in a line. Tick what goes in, **Preview** it, then **Save as file**
  (one page that reads well on a phone) or **Copy as text**. The people you met are named by their
  role unless you tick **Name the people I met**; your notes, the deep dives' fit and risks, Ask and
  your calendar never go in. Made here, with no Claude run.
- **Share a deep dive with a friend.** It saves a file without your notes, mark, chat, people or
  the sections about you. Your friend imports it and redoes those sections with their own background.

## What you need

- macOS, Linux, or Windows 10 or 11 (see [Windows](#windows) for what's different there).
- Chrome, or another Chromium browser (Brave, Edge, Arc, Vivaldi).
- [Node 22 or later](https://nodejs.org).
- [Claude Code](https://claude.com/claude-code), signed in with your Claude plan (Pro or Max): run
  `claude`, then `/login`.
- Optional: git, signed in to where your project repos are, for their docs (on a Mac, run
  `xcode-select --install` if you don't have it; on Windows,
  [Git for Windows](https://git-scm.com/download/win)).

## Install

On a Mac or Linux, in a terminal:

```sh
curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh
```

On Windows, in PowerShell (not as administrator, and not in WSL or Git Bash):

```powershell
irm https://github.com/NickHarder/partner-copilot/releases/latest/download/install.ps1 | iex
```

It puts Partner Copilot in `~/.gauntlet-copilot` (on Windows, `%USERPROFILE%\.gauntlet-copilot`),
registers its helper with your browsers, and checks that Claude Code is signed in (with a one-word
reply, which uses a tiny bit of your plan).

Then, once, in Chrome:

1. Open `chrome://extensions` and turn on **Developer mode**.
2. Click **Load unpacked** and choose the folder the install printed,
   `~/.gauntlet-copilot/extension` (on Windows, `%USERPROFILE%\.gauntlet-copilot\extension`). In
   the folder picker, press ⌘⇧G on a Mac or Ctrl+L elsewhere and paste the path: on a Mac and
   Linux the folder is hidden, and on a Mac and Windows the install usually put the path on your
   clipboard.
3. Pin it: click the puzzle piece in the toolbar, then the pin next to Partner Copilot.

From then on, Chrome starts the helper by itself when you need it, and it stops after an hour of
not being used. There's no terminal to keep open.

## First run

1. Options opens by itself and should say **Connected automatically**. Click **Open the side
   panel** under it (or click Partner Copilot in the toolbar). If it doesn't say Connected, see
   [Troubleshooting](#troubleshooting).
2. If you haven't pinned it yet: click the puzzle piece in the toolbar, then the pin next to Partner
   Copilot.
3. Follow **Get started** at the top of the panel's home. Each step ticks itself once it's done:
   - **Connect to Claude Code**: done once the helper answers. If it can't, the step says what to
     run.
   - **Tell it about you**: under **You**, add your name as interview sheets list it and your resume
     as a PDF or .docx (it's read in your browser), and click **Save**. Then open **My projects** on
     the portal and click **Sync to Copilot** at the bottom right of that page.
   - **Add your schedule** (optional): **Import your schedule**, then **Choose a file…** for the
     .xlsx Gauntlet sends (a sheet per day), a PDF, or drop the file on the card, or paste the
     event-day announcements from Slack. Without a name set it asks for yours, suggesting the names
     on the sheets, and shows your interviews before you **Save**. Add later ones with **Add a
     day**: they're kept, day by day. The file is read in your browser and never sent.
   - **Run your first deep dive**: on **Partner projects**, click **Company info** on a partner, or
     **View full profile** on a card on **Hiring partners**. The panel opens on it and starts a deep
     dive, which takes a few minutes. Add your resume first, so it's written for you.

When every step is done, it says **You're set up**. **Help**, at the bottom of the panel, shows the
list again, with links to this guide.

**Shortcuts:** **Alt+Shift+I** switches Interview mode, **Alt+Shift+L** logs a conversation. Both
are on the toolbar icon's right-click menu too; change them at `chrome://extensions/shortcuts`.

**On interview day:** Interview mode turns itself on 10 minutes before each of your slots and opens
that partner: the company, who you're meeting and your questions, nothing private. Switch it with
**Alt+Shift+I** or **⋯** at the top right.

## Update

Once a day, the helper checks GitHub for a newer version. When there is one, the bottom of the side
panel says **0.4.1 available · What's new ↗** (with whichever version is newest), and Options ›
Connection shows the install line with a **Copy** button. Run the same line again: on a Mac or
Linux, in a terminal,

```sh
curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh
```

and on Windows, in PowerShell,

```powershell
irm https://github.com/NickHarder/partner-copilot/releases/latest/download/install.ps1 | iex
```

Then click **Reload to update** at the bottom of the side panel (or Partner Copilot's reload button
on `chrome://extensions`), and reload any portal tab. Your data stays.

The check sends nothing about you (see [PRIVACY.md](PRIVACY.md#nothing-else-leaves-your-computer)).
To turn it off, set `GAUNTLET_COPILOT_NO_UPDATE_CHECK=1` in your shell's profile, open a new
terminal, and run the install line again (on Windows, see [Windows](#windows) for how a setting is
kept).

## Uninstall

1. On `chrome://extensions`, click **Remove** on Partner Copilot. That deletes what it saved in
   Chrome.
2. On a Mac or Linux, in a terminal:
   ```sh
   node ~/.gauntlet-copilot/app/cli.js uninstall && rm -rf ~/.gauntlet-copilot
   ```
   On Windows, in PowerShell:
   ```powershell
   node "$env:USERPROFILE\.gauntlet-copilot\app\cli.js" uninstall
   if ($LASTEXITCODE -eq 0) { Remove-Item -LiteralPath "$env:USERPROFILE\.gauntlet-copilot" -Recurse -Force }
   ```

Your backups in `~/Partner Copilot` (on Windows, `%USERPROFILE%\Partner Copilot`) stay. To delete
them and everything else, see [Delete everything](PRIVACY.md#delete-everything).

## Privacy

- What it gathers stays on your computer: in Chrome, in backups in `~/Partner Copilot` (and the
  project folders you start, in its `Projects` folder), and in `~/.gauntlet-copilot` (both under
  `%USERPROFILE%` on Windows). Partner Copilot has no server of its own and no analytics.
- Research runs through your own Claude Code, so what it needs (the portal's text, project briefs,
  your background and notes, the names of people you look up) goes to Anthropic, as in any of your
  Claude Code sessions.
- **Share with a friend** saves a file and sends nothing: you choose whom to give it to.

[PRIVACY.md](PRIVACY.md) says what's stored where, exactly what goes to Anthropic, and how to
delete it all.

## Troubleshooting

| You see | Do this |
| --- | --- |
| **Not connected · Fix** at the bottom of the panel, "One-time setup needed" or "Chrome couldn't start the helper" | Click **Fix**: Get started says what to run. Run the install line again (also after you move or update Node). If it still fails, `node ~/.gauntlet-copilot/app/cli.js doctor` says what's wrong, and the helper's log is `~/.gauntlet-copilot/helper.log`. On Windows: `node "$env:USERPROFILE\.gauntlet-copilot\app\cli.js" doctor`, and the log is `%USERPROFILE%\.gauntlet-copilot\helper.log` |
| The install line says "This installer is for macOS and Linux" or "This is WSL" | On Windows, run the PowerShell line under [Install](#install) in PowerShell itself: Chrome can't start a helper installed in WSL, Git Bash or Cygwin |
| On Windows, "Run this as yourself" | Open PowerShell from the Start menu as usual, not with **Run as administrator**, and run the line again |
| On Windows, "The download didn't work" | Try again in a minute. If it keeps failing, Windows 10 or 11 with its updates is needed (older PowerShells can't reach GitHub) |
| On Windows, "is a script Windows can't start directly" or Claude Code not found, though `claude` works in PowerShell | Set `GAUNTLET_COPILOT_CLAUDE_BIN` to the full path of `claude.exe` (see [Windows](#windows) for how a setting is kept), then run the install line again |
| On Windows, a browser other than the one you installed with says **Not connected** | The install registers the helper with each browser that has run on this computer: open the new one once, then run the install line again |
| Clicking **Company info** does nothing | Reload the portal tab (Get started offers **Reload the portal tab** when it can't reach it). A tab open since before you installed Partner Copilot may not see the click until then |
| "Claude Code isn't signed in" | In a terminal, run `claude`, then `/login` |
| A run stops because your plan doesn't include its model | Choose another model in Options, under **Advanced settings › Models** |
| Under You, "couldn't read this repo with your git sign-in" | Run the `git clone` command it shows in a terminal. Once that works (sign in, or add your SSH key to your git host), click **Refresh docs** |
| "usage limit is reached" | Wait for the reset (the panel's footer shows your plan's usage), or choose a lighter model in Options |
| **0.4.1 available** (or another version) at the bottom of the panel | A newer version is out: run the install line under [Update](#update) (Options › Connection has it, with **Copy**), then **Reload to update** |
| **Reload to update** at the bottom of the panel | Click it after an update, then reload any portal tab |
| "Partner Copilot was updated: reload this page" | Reload the portal tab |
| Your notes have a line `Saved under "…" before it was linked:` | You took notes under the schedule's spelling of a partner and under the portal's: they were merged when the two were matched. Edit them as you like |

## Windows

Partner Copilot runs on Windows 10 and 11, with Chrome, Edge, Brave, Chromium or Vivaldi. Install
and update it with the PowerShell line under [Install](#install), in PowerShell itself: not as
administrator, and not in WSL, Git Bash or Cygwin, where Chrome can't start the helper. What's
different from a Mac or Linux:

- Everything is under your profile folder: the helper and the extension in
  `%USERPROFILE%\.gauntlet-copilot`, your backups in `%USERPROFILE%\Partner Copilot`. Nothing is
  written outside it and your own part of the registry, so no administrator is needed.
- The install registers the helper with each browser that has run on this computer, through a
  registry key, `HKCU\Software\<Browser>\NativeMessagingHosts\com.gauntlet.partner_copilot`, that
  names a manifest in `%USERPROFILE%\.gauntlet-copilot`. [Uninstall](#uninstall) removes the keys.
- Claude Code is found on your PATH as `claude.exe` (Claude Code's own installer) or `claude.cmd`
  (npm). If it's somewhere else, set `GAUNTLET_COPILOT_CLAUDE_BIN` to its full path.
- A setting such as `GAUNTLET_COPILOT_NO_UPDATE_CHECK` or `GAUNTLET_COPILOT_BACKUP_DIR` is kept as
  a user environment variable, so the helper Chrome starts gets it: in PowerShell,
  `[Environment]::SetEnvironmentVariable('GAUNTLET_COPILOT_NO_UPDATE_CHECK', '1', 'User')`, then
  open a new PowerShell and run the install line again.
- To run the helper yourself instead (Options › **Advanced: connect manually**):
  `node "$env:USERPROFILE\.gauntlet-copilot\app\cli.js" serve`.

## Feedback

Report a problem or ask for something in [Issues](https://github.com/NickHarder/partner-copilot/issues) (Options and
the panel's **Help** link there too, as **Report a problem**).

If something on the portal is read wrong, open that page and click **Debug snapshot** at the bottom
of the side panel: it copies what the extension sees there. It holds text from the portal, so don't
post it in the issue: say you have one, and send it privately when asked.
