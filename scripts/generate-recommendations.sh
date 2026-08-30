#!/usr/bin/env bash

set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
source="$root/data/blogroll.json"
output_dir="$root/static/.well-known"

mkdir -p "$output_dir"
jq '.' "$source" > "$output_dir/recommendations.json"

{
  printf '%s\n' '<?xml version="1.0" encoding="UTF-8"?>'
  printf '%s\n' '<opml version="2.0">'
  printf '%s\n' '  <head><title>Places to go. People to see.</title></head>'
  printf '%s\n' '  <body>'
  jq -r '
    def xml:
      gsub("&"; "&amp;") |
      gsub("<"; "&lt;") |
      gsub(">"; "&gt;") |
      gsub("\\\""; "&quot;");
    .[] | "    <outline text=\"\(.name | xml)\" title=\"\(.name | xml)\" type=\"link\" htmlUrl=\"\(.url | xml)\" />"
  ' "$source"
  printf '%s\n' '  </body>'
  printf '%s\n' '</opml>'
} > "$output_dir/recommendations.opml"
