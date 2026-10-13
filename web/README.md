# Weather Beats v2 (web)

Music for the weather and your mood. Pick a sky (Clear, Overcast, Rain, Snow, Thunderstorm) and a mood (Happy, Sad), and Weather Beats plays a loop composed for that pairing.

Everything is one file: `index.html`. No build step, no dependencies, no API keys.

## The music

All ten tracks are composed and synthesized in the browser by the page's own code (Web Audio). There are no samples and no third-party recordings. Each track is a seeded composition, so it sounds the same every time.

| Sky | Happy | Sad |
|---|---|---|
| Clear (SKC) | Glasshouse · C Lydian · 116 BPM | Long Shadows · A Aeolian · 74 BPM |
| Overcast (OVC) | Overcast Bicycle · F Ionian · 90 BPM | Grey Lantern · D Dorian · 66 BPM |
| Rain (RA) | Puddle Jumper · G Ionian · 122 BPM | Window Seat · E Aeolian · 72 BPM |
| Snow (SN) | First Footprints · B♭ Ionian · 104 BPM | White Hours · C♯ Aeolian · 58 BPM |
| Thunderstorm (TS) | Charged Air · E Mixolydian · 132 BPM | Under the Front · F Phrygian · 80 BPM |

Every track can be downloaded as a seamless-loop WAV (16-bit, 44.1 kHz) inside a zip with its license, or all ten at once.

**License:** the music is dedicated to the public domain under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/). Use it anywhere, commercially or not, with no credit required.

## Live weather

When the page is served from a normal host, it shows a "Use my local weather" button. It uses the browser's location and [Open-Meteo](https://open-meteo.com/) (free, no key) to pick the matching sky. Where network access is blocked, the button stays hidden and you pick the sky by hand.

## Run it

Open `index.html` in a browser, or serve the folder with any static host:

```sh
cd web && python3 -m http.server 8000
```

To deploy on Vercel, import the repo and set the project's root directory to `web`.

## Adding or changing a track

Tracks live in the `TRACKS` array near the top of the script. Each entry sets the key (`root` as a MIDI note), `mode`, `bpm`, length in `bars`, the chord progression as scale degrees (`prog`), and the instruments: `pad`, `bass` (`pulse`, `long`, `walk`), `arp`, `comp`, melody voice (`melV`), `drums` (`four`, `lofi`, `brush`, `drive`, `half`, `none`) and weather sound (`tex`). Change `seed` to get a different melody with the same settings.
