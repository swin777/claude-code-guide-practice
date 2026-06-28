#!/usr/bin/env bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

PATTERNS=(
    'rm[[:space:]]+-[a-zA-Z]*r[a-zA-Z]*f'
    'rm[[:space:]]+-[a-zA-Z]*f[a-zA-Z]*r'
    'DROP[[:space:]]+(TABLE|DATABASE|SCHEMA)'
    'git[[:space:]]+push[[:space:]]+(.*[[:space:]])?--force'
    'git[[:space:]]+push[[:space:]]+(.*[[:space:]])?-f([[:space:]]|$)'
    'git[[:space:]]+push[[:space:]]+(.*[[:space:]])?--force-with-lease'
    'chmod[[:space:]]+-R[[:space:]]+777'
    'mkfs\.'
    'dd[[:space:]]+if='
    '>\s*/dev/sd[a-z]'
)

for pattern in "${PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qiE "$pattern"; then
        REASON="Blocked: command matches dangerous pattern. Command: $(echo "$COMMAND" | head -c 200)"
        jq -n --arg reason "$REASON" '{
            hookSpecificOutput: {
                hookEventName: "PreToolUse",
                permissionDecision: "deny",
                permissionDecisionReason: $reason
            }
        }'
        exit 2
    fi
done

exit 0
