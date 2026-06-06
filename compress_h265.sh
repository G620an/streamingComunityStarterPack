#!/bin/bash
# Script H.265 Hardware ottimizzato per la massima riduzione del peso del file su M3

SRC_DIR="Video"
OUT_DIR="${SRC_DIR}/compressed"
FFMPEG_NATIVE="/opt/homebrew/bin/ffmpeg"

mkdir -p "$OUT_DIR"

CODEC_VIDEO="hevc_videotoolbox"
CODEC_AUDIO="aac"
AUDIO_BITRATE="128k"

# Abbassiamo a 45 per garantire file molto più leggeri dell'originale
GLOBAL_QUALITY="45"

shopt -s nullglob nocaseglob

for file in "$SRC_DIR"/*.{mp4,mkv,avi,flv,mov}; do
    filename=$(basename "$file")
    [[ "$filename" == *"_"* ]] && continue
    
    outfile="$OUT_DIR/${$filename}_.mp4"
    
    echo ">>> Compressione Hardware M3 di: $filename"
    
    # -preset quality: Forza il chip M3 a comprimere al massimo
    # -pix_fmt yuv420p -profile:v main: Standard a 8-bit ultra-compatibile che non fallisce all'avvio
    # -an: Rimosso temporaneamente il mapping complesso per evitare blocchi sui flussi audio
    $FFMPEG_NATIVE -fflags +genpts -i "$file" \
        -c:v "$CODEC_VIDEO" -global_quality "$GLOBAL_QUALITY" -preset quality -profile:v main \
        -c:a "$CODEC_AUDIO" -b:a "$AUDIO_BITRATE" \
        -pix_fmt yuv420p -tag:v hvc1 "$outfile" -y
    
    if [ $? -eq 0 ]; then
        echo "✅ Fatto: $outfile"
    else
        echo "❌ Errore durante la compressione."
    fi
done

shopt -u nullglob nocaseglob
echo "🎉 Procedura completata!"
