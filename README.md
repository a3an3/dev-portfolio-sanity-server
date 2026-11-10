# Dev Portfolio – Sanity Server

Sanity Content Studio that serves as the headless CMS for my developer portfolio.
It holds the content schema and the content itself. An example static website
pulls this content at build time and is provisioned from it.

## What's inside

| Path | Purpose |
|---|---|
| `schemaTypes/` | Content model: projects, work experience, skills |
| `sanity.config.ts` | Studio configuration (project, dataset, plugins) |
| `sanity.cli.ts` | CLI configuration for deploys |
| `schema.json` / `sanity.types.ts` | Extracted schema and generated TypeScript types for the website |
| `static/` | Static assets for the Studio |
| `seed/` | CV-based content and placeholder images to import into the dataset |

## How it works

1. Content is edited in the Sanity Studio.
2. The [portfolio website](https://github.com/a3an3/dev-portfolio) queries the content via GROQ
   on the server and prerenders its pages at build time.
3. After publishing new content, a redeploy of the website picks it up
   (a Sanity webhook can trigger the Vercel deploy hook for this).

## Seed content

`seed/` holds the content from my CV as Sanity documents: work experience, projects and skills.
The project images in `seed/placeholders/` are placeholders until real screenshots replace them.

```bash
npx sanity login
./seed/import.sh   # removes the old demo documents and imports seed/cv-content.ndjson
```

## Getting started

```bash
npm install
npm run dev        # Studio on http://localhost:3333
