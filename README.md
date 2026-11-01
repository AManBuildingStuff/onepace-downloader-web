<img src="assets/icon.svg" width="64" height="64" alt="">

# One Pace Downloader (web, zero setup)

A single-page web version of [Nicolaslahri/onepacedownloader](https://github.com/Nicolaslahri/onepacedownloader) for macOS (or any OS).
It needs no install, no server, and no Docker. **Double-click `index.html`.**

- **Torrent mode:** each episode, or a whole-arc pack, opens as a `magnet:` link in Transmission or whatever torrent client handles magnets.
- **Direct mode:** each episode downloads straight from Pixeldrain in your browser. You choose Sub, Dub, or Dub + CC, and the quality. Dubs that One Pace hasn't made yet fall back to Muhn Pace.
- **Batch:** tick episodes and click **Send to torrent client** (or **Download all**). **Copy links** puts every selected link on your clipboard.
- **Tracking:** episodes you've sent show as "Sent" or "Downloaded", with a per-arc `x/y` count (stored in the browser's localStorage).

## Catalog

On load, the page fetches the catalog from upstream's weekly auto-refreshed `data` branch:
`https://raw.githubusercontent.com/Nicolaslahri/onepacedownloader/data/episode_index.json`.
If GitHub can't be reached, it uses the last cached copy, then `catalog-snapshot.js`.
To refresh the snapshot, run `./scripts/update-snapshot.sh`.

## One-time setup tips

See **Setup tips** in the app. In short: make Transmission the default handler for magnet links, and turn off its "open torrent" confirmation window.
If Pixeldrain or nyaa.si don't load, your ISP is likely blocking them through DNS; set your Mac's DNS to `1.1.1.1`.

## Credits

The episode catalog (`catalog-snapshot.js` and the live `data` branch) comes from
[Nicolaslahri/onepacedownloader](https://github.com/Nicolaslahri/onepacedownloader) (MIT).
This project only links to content hosted elsewhere; it hosts no video.
