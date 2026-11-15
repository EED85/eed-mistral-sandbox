#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" != "KILL" ]]; then
    echo "Refusing to stop Vibe sessions. Run the task again and type KILL to confirm." >&2
    exit 2
fi

find_vibe_pids() {
    ps -eo pid=,comm= |
        awk '$2 == "vibe-rs" || $2 == "vibe-app-server" { print $1 }'
}

mapfile -t pids < <(find_vibe_pids)

if ((${#pids[@]} == 0)); then
    echo "No Vibe sessions are running."
    exit 0
fi

printf 'Stopping Vibe processes: %s\n' "${pids[*]}"
kill -TERM "${pids[@]}"
sleep 2

mapfile -t remaining < <(find_vibe_pids)

if ((${#remaining[@]} > 0)); then
    printf 'Force-stopping unresponsive Vibe processes: %s\n' "${remaining[*]}"
    kill -KILL "${remaining[@]}"
    sleep 1
fi

mapfile -t remaining < <(find_vibe_pids)

if ((${#remaining[@]} > 0)); then
    printf 'Some Vibe processes could not be stopped: %s\n' "${remaining[*]}" >&2
    exit 1
fi

echo "All Vibe sessions have been stopped."
