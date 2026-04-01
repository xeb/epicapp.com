# EpicApp

**Long Running Autonomous Agents** — Deploy once, run forever.

A fun landing page for a (totally real) company that builds agents so persistent they develop their own opinions.

## Deploy

The site is a single `index.html` served via nginx on `gal.xeb.ai`.

```bash
# On gal.xeb.ai
cd ~/p/epicapp.com && git pull
# That's it — nginx serves the directory
```

## Setup (first time on gal)

```bash
git clone https://github.com/xeb/epicapp.com.git ~/p/epicapp.com
sudo bash ~/p/epicapp.com/setup_gal.sh
```

## DNS

- `epicapp.com` → A record → 31.220.49.75 (gal.xeb.ai)
- `www.epicapp.com` → A record → 31.220.49.75
- Managed in AWS Route53 (zone ZVKVUZRA3UHPN)
