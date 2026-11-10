# Dev Portfolio – Sanity Server

Sanity Content Studio that serves as the headless CMS for my developer portfolio.
It holds the content schema and the content itself. An example static website
pulls this content at build time and is provisioned from it.

## What's inside

| Path | Purpose |
|---|---|
| `schemaTypes/` | Content model: [e.g. projects, experience, skills, about] |
| `sanity.config.ts` | Studio configuration (project, dataset, plugins) |
| `sanity.cli.ts` | CLI configuration for deploys |
| `schema.json` / `sanity.types.ts` | Extracted schema and generated TypeScript types for the website |
| `static/` | Static assets for the Studio |

## How it works

1. Content is edited in the Sanity Studio.
2. The example static website queries the content via GROQ at build time,
   using the generated types from `sanity.types.ts`.
3. On publish, a webhook triggers a rebuild, so the site is re-provisioned
   with the latest content.

## Getting started

```bash
npm install
npm run dev        # Studio on http://localhost:3333
