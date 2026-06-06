#!/bin/bash
#script per comprimere video usando ffmpeg con codec h265 e audio aac (sfrutta hardware acceleration su macOS)
#Cartella da cui parte a trovare i file video (puoi cambiarla se vuoi, ma assicurati che sia corretta)
SRC_DIR="Video"
# Cartella di destinazione
OUT_DIR="${SRC_DIR}/compressed"

# Crea la cartella di output se non esiste
mkdir -p "$OUT_DIR"

# Parametri di codifica
VIDEO_BITRATE="1100k"
AUDIO_BITRATE="128k"
CODEC_VIDEO="h264_videotoolbox" #CODEC_VIDEO="h264_videotoolbox" per passare al vecchio codec h264 (più compatibile ma meno efficiente)
CODEC_AUDIO="aac"
CRF="22"   # qualità visiva (più alto = più compressione, 26-30 è buono per anime)

# Loop su tutti i file video nella cartella
for file in "$SRC_DIR"/*.{mp4,mkv,avi,flv,mov}; do
    [ -e "$file" ] || continue  # salta se non ci sono file
    filename=$(basename "$file")
    outfile="$OUT_DIR/${filename%.*}_.mp4"
    
    echo ">>> Compressione di: $filename"
    
    ffmpeg -i "$file" \
        -c:v $CODEC_VIDEO -b:v $VIDEO_BITRATE -crf $CRF \
        -c:a $CODEC_AUDIO -b:a $AUDIO_BITRATE \
        -preset veryslow -pix_fmt yuv420p \
        "$outfile"
    
    echo "Fatto: $outfile"
done

echo "Compressione completata!"
