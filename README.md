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
  project brief with its PDFs.
- **You.** Your name as interview sheets list it, your resume, links, a note about you, and your
  projects from My projects, in one place. Deep dives and Ask use them, with the README and design
  docs of each project's repo, read with your own git sign-in (so a private repo works too). You
  choose which docs go in.
- **Home.** Your next event day: your interviews by time and room, each with what's ready for it
  (**Brief ✓**, **Deep dive ✓**, **Prep ✓**, who you're meeting, **✎ Notes**). **Prep ✓**
  opens straight to the interview prep. Above it, **After your interviews** lists each debrief or
  next step waiting on you. Below it, a board of your partners: first the ones waiting on you after
  a meeting, then by when you meet each one.
- **A deep dive takes a few minutes.** Meanwhile its board row says **Researching…** with the
  time so far, and the toolbar icon shows **…**, then **✓** (or **!** if it stopped) until you
  open it, even if you closed the panel.
- **After a meeting.** **How did it go?** adds a debrief to your notes and sets a next step, with a
  due date if you like, that the board reminds you of. **Draft a thank-you** writes a note to the
  people you met.
- **Share a deep dive with a friend.** It saves a file without your notes, chat, people or the
  sections about you. Your friend imports it and redoes those sections with their own background.

## What you need

- macOS or Linux (for Windows, see [Windows](#windows)).
- Chrome, or another Chromium browser (Brave, Edge, Arc, Vivaldi).
- [Node 22 or later](https://nodejs.org).
- [Claude Code](https://claude.com/claude-code), signed in with your Claude plan (Pro or Max): run
  `claude`, then `/login`.
- Optional: git, signed in to where your project repos are, for their docs (on a Mac, run
  `xcode-select --install` if you don't have it).

## Install

In a terminal:

```sh
curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh
```

It puts Partner Copilot in `~/.gauntlet-copilot`, registers its helper with your browsers, and
checks that Claude Code is signed in (with a one-word reply, which uses a tiny bit of your plan).

Then, once, in Chrome:

1. Open `chrome://extensions` and turn on **Developer mode**.
2. Click **Load unpacked** and choose the folder the install printed,
   `~/.gauntlet-copilot/extension`. It's hidden, so in the folder picker press ⌘⇧G on a Mac (the
   install put the path on your clipboard) or Ctrl+L on Linux, and paste it.
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
     PDF (it's read in your browser), and click **Save**. Then open **My projects** on the portal and
     click **Sync to Copilot** at the bottom right of that page.
   - **Add your schedule** (optional): paste the event-day announcements and your interview sheets
     from Slack, and click **Add**. Add later ones with **Add a sheet**: they're kept, day by day.
   - **Run your first deep dive**: on **Partner projects**, click **Company info** on a partner, or
     **View full profile** on a card on **Hiring partners**. The panel opens on it and starts a deep
     dive, which takes a few minutes. Add your resume first, so it's written for you.

When every step is done, it says **You're set up**. **Help**, at the bottom of the panel, shows the
list again, with links to this guide.

## Update

Run the same line again:

```sh
curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh
```

Then click **Reload to update** at the bottom of the side panel (or Partner Copilot's reload button
on `chrome://extensions`), and reload any portal tab. Your data stays.

## Uninstall

1. On `chrome://extensions`, click **Remove** on Partner Copilot. That deletes what it saved in
   Chrome.
2. In a terminal:
   ```sh
   node ~/.gauntlet-copilot/app/cli.js uninstall && rm -rf ~/.gauntlet-copilot
   ```

Your backups in `~/Partner Copilot` stay. To delete them and everything else, see
[Delete everything](PRIVACY.md#delete-everything).

## Privacy

- What it gathers stays on your computer: in Chrome, in backups in `~/Partner Copilot`, and in
  `~/.gauntlet-copilot`. Partner Copilot has no server of its own and no analytics.
- Research runs through your own Claude Code, so what it needs (the portal's text, project briefs,
  your background and notes, the names of people you look up) goes to Anthropic, as in any of your
  Claude Code sessions.
- **Share with a friend** saves a file and sends nothing: you choose whom to give it to.

[PRIVACY.md](PRIVACY.md) says what's stored where, exactly what goes to Anthropic, and how to
delete it all.

## Troubleshooting

| You see | Do this |
| --- | --- |
| **Not connected · Fix** at the bottom of the panel, "One-time setup needed" or "Chrome couldn't start the helper" | Click **Fix**: Get started says what to run. Run the install line again (also after you move or update Node). If it still fails, `node ~/.gauntlet-copilot/app/cli.js doctor` says what's wrong, and the helper's log is `~/.gauntlet-copilot/helper.log` |
| Clicking **Company info** does nothing | Reload the portal tab (Get started offers **Reload the portal tab** when it can't reach it). A tab open since before you installed Partner Copilot may not see the click until then |
| "Claude Code isn't signed in" | In a terminal, run `claude`, then `/login` |
| A run stops because your plan doesn't include its model | Choose another model in Options, under **Advanced settings › Models** |
| Under You, "couldn't read this repo with your git sign-in" | Run the `git clone` command it shows in a terminal. Once that works (sign in, or add your SSH key to your git host), click **Refresh docs** |
| "usage limit is reached" | Wait for the reset (the panel's footer shows your plan's usage), or choose a lighter model in Options |
| **Reload to update** at the bottom of the panel | Click it after an update, then reload any portal tab |
| "Partner Copilot was updated: reload this page" | Reload the portal tab |
| Your notes have a line `Saved under "…" before it was linked:` | You took notes under the schedule's spelling of a partner and under the portal's: they were merged when the two were matched. Edit them as you like |

## Windows

The install line is for macOS and Linux. On Windows, run the helper yourself:

1. Download `partner-copilot-extension.zip` and `gauntlet-copilot-cli.js` from the
   [latest release](https://github.com/NickHarder/partner-copilot/releases/latest).
2. Unzip the extension, and choose its folder in **Load unpacked** (as in [Install](#install)).
3. In a terminal, in the folder with `gauntlet-copilot-cli.js`, run
   `node gauntlet-copilot-cli.js serve`, and keep it running while you use the extension. If it
   can't find Claude Code, set `GAUNTLET_COPILOT_CLAUDE_BIN` to the full path of `claude.exe`
   first.
4. Paste the token it prints into the extension's Options, under **Advanced: connect manually**,
   and click **Save**.

## Feedback

Report a problem or ask for something in [Issues](https://github.com/NickHarder/partner-copilot/issues) (Options and
the panel's **Help** link there too, as **Report a problem**).

If something on the portal is read wrong, open that page and click **Debug snapshot** at the bottom
of the side panel: it copies what the extension sees there. It holds text from the portal, so don't
post it in the issue: say you have one, and send it privately when asked.
