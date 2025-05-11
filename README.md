# n8n-extended

Custom n8n image with pre-installed external libraries, published to GitHub Container Registry and updated automatically via GitHub Actions.

---

## ✨ Key Features

| Capability                  | Detail                                                                    |
| --------------------------- | ------------------------------------------------------------------------- |
| **Pre-bundled libs**        | `pg`, `pg-connection-string` (add your own)                               |
| **Auto-sync with upstream** | Weekly cron + manual dispatch rebuild against the latest `n8nio/n8n` tag  |
| **Multi-tag push**          | Semantic image tag (`<n8n-ver>`) **and** `latest`                         |
| **Provenance & cache**      | Buildx cache in GHCR, optional SLSA attestations                          |
| **Public consumption**      | Ready-to-pull from `ghcr.io/Smirnov-Labs/n8n-extended` via Docker Compose |

---

## 🚀 Quick Start

```bash
# 1 — login if your GHCR repo is private
# echo $GITHUB_PAT | docker login ghcr.io -u <user> --password-stdin

# 2 — run via docker compose
mkdir n8n && cd n8n
curl -O https://raw.githubusercontent.com/Smirnov-Labs/n8n-extended/main/docker-compose.yml
docker compose up -d
```

`docker-compose.yml` pulls **`ghcr.io/Smirnov-Labs/n8n-extended:latest`** and exposes n8n on **:5678**.

---

## 🏗️ Image Build Pipeline

1. Custom `Dockerfile` extends n8n with a few choice packages.
2. Github Actions builds and pushes the image.

*Manual* rebuilds: **Actions → *Build & Push n8n-custom* → *Run workflow*** and supply a specific upstream n8n tag if required.

---

## 🛠️ Extending the Image

1. Edit **Dockerfile** and add more `npm install -g <pkg>` lines.
2. Commit & push – CI will rebuild and publish new tags.
3. Update your compose file’s tag if you pin versions.

> Bigger images mean slower cold-starts; keep your library set lean.

---

## 🔒 Security Practices

* Use **Dependabot** (or Renovate) to pin upstream image and Node package updates.
* Enable GHCR **image vulnerability scanning**.
* Consider adding `--provenance=true` in the build step for signed SBOMs.

---

## 🗓️ Maintenance Calendar

| Frequency | Task                                               |
| --------- | -------------------------------------------------- |
| Weekly    | Automatic rebuild against new n8n release via cron |
| Quarterly | Review installed packages and drop unused ones     |
| Ad-hoc    | Workflow dispatch for urgent upstream CVE fix      |

---

## 📝 License

This repository is MIT-licensed. n8n itself is [Faircode](https://faircode.io/). Ensure your usage complies with n8n’s license terms.

---

## 🙏 Acknowledgements

* [DevOps.dev – Adding external packages to n8n](https://blog.devops.dev/how-to-add-an-external-package-to-n8n-for-postgresql-connections-in-a-code-node-workflow-8f05f4650eaa)
* [Elest.io – Installing additional libraries for n8n](https://blog.elest.io/how-to-install-additional-libraries-for-n8n/)
