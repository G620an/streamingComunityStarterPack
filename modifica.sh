----------------------------Codice per rinomina mp4---------------------------
#non eseguire direttamente ma copia e incolla in terminale (assicurati di essere nella cartella giusta con i file da rinominare)

#!/bin/bash

season="01" 

shopt -s nullglob

count=1




for f in $(ls -1v *.mp4 2>/dev/null); do
  [ -e "$f" ] || continue
		
  episode=$(printf "%02d" "$count")
  newname="${season}x${episode}_.mp4"
  
  if [[ "$f" == "$newname" ]]; then
        echo "Saltato (già corretto): $f"
	continue
     else
        # -n impedisce di sovrascrivere file esistenti
        mv -n -- "$f" "$newname"
        echo "Rinominato: $f -> $newname"
  fi  
  ((count++))
done




----------------------------Codice per rinomina Trickplay---------------------------
#idem come sopra ma per i file .trickplay (se li hai, altrimenti non serve eseguirlo)
shopt -s nullglob

count=1

for f in $(ls -d *.trickplay 2>/dev/null); do
  episode=$(printf "%02d" "$count")
  newname="${season}x${episode}_.trickplay"
  
  if [[ "$f" == "$newname" ]]; then
        echo "Saltato (già corretto): $f"
	continue
     else
        # -n impedisce di sovrascrivere file esistenti
        mv -n -- "$f" "$newname"
        echo "Rinominato: $f -> $newname"
  fi  
  ((count++))

  ((count++))
done

