#!/usr/bin/env bash
set -euo pipefail
echo "[post-create] Bringing up Memgraph + Lab…"
docker compose up -d
echo "[post-create] Waiting for memgraph to be ready…"
for i in {1..30}; do
  if docker compose exec -T memgraph bash -lc 'echo SHOW TRANSACTIONS; | mgconsole' >/dev/null 2>&1; then
    break
  fi
  sleep 1
done
echo "[post-create] Loading init/bandu_kg_init.cypher…"
docker compose exec -T memgraph bash -lc 'cat /workspace/init/bandu_kg_init.cypher | mgconsole' || true
echo "[post-create] Done. Open the forwarded port 3000 for Memgraph Lab."
