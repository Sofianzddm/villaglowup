#!/usr/bin/env bash
# Compresse villa-video-upscaled.mp4 en version web optimisée pour le hero
# Usage : place villa-video-upscaled.mp4 dans ce dossier, puis : ./compress-video.sh

set -e
INPUT="${1:-villa-video-upscaled.mp4}"
OUTPUT="${2:-villa-video.mp4}"

if [[ ! -f "$INPUT" ]]; then
  echo "Fichier source introuvable : $INPUT"
  echo "Usage: $0 [fichier_source.mp4] [fichier_sortie.mp4]"
  exit 1
fi

echo "Compression de $INPUT -> $OUTPUT (web optimisé, ~5-15 Mo)…"
ffmpeg -i "$INPUT" -c:v libx264 -crf 28 -preset slow -an -movflags +faststart -vf "scale=1920:-2" "$OUTPUT"
echo "Terminé : $OUTPUT"
ls -lh "$OUTPUT"
