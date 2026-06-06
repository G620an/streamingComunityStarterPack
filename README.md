<html>

<h1>
  Installazione di streamingcommunity e delle sue dipendenze:
</h1>
<br>

<p>
  #Posizionatevi su una cartella desiderata<br>
  mkdir ~/Media <br>
  python3 -m venv myenv <br>
  source myenv/bin/activate<br>
  export PYTHONIOENCODING=utf-8<br>
  pip install streamingcommunity<br>
  pip install rich<br>
  pip install pyplayready<br>
  pip install httpx<br>
  pip install unidecode<br>
  pip install pathvalidate<br>
  pip install ua_generator<br>
  pip install curl_cffi<br>
  pip install bs4<br>
  pip install ttconv<br>
  pip install pywidevine<br>
</p>

<hr>

<h1>
  AVVIO successivo:
</h1>
<br>

<p>
  #Scaricate tutti i file caricati nella repository e sostituiteli a quelli scaricati da streamingcomunity (soprattutto d.py)
  source myenv/bin/activate<br>
  export PYTHONIOENCODING=utf-8<br>
  python3 d.py<br>
</p>
<br>

<hr>

<h1>
  Eventuali upgrade:
</h1>
<br>

<p>
  source myenv/bin/activate<br>
  export PYTHONIOENCODING=utf-8<br>
  pip install --upgrade streamingcommunity
</p>
<br>

<hr>

<h1>
  Extras:
</h1>
<br>
<p>
<ul>
  <li>compress_h264.sh:<br>
  <ul>
    <li>Posizionare i video nella cartella più esterna Video</li>
    <li>Creare la cartella compressed all'interno di Video</li>
    <li>./compress_h264.sh</li>
  </ul>
    <b>N.B.</b> lo script è pensato per funzionare con hwa Macbook Pro processori M con Videotoolbox</li>
  <br><br>
  <li>compress_h265.sh: Idem come sopra solo con codec h265</li>
  <br><br>
  <li>modifica.sh: <br>
  <ul>
    <li>Posizionatevi nella stagione della serie desiderata</li>
    <li>Aprite il file dello script e copiate il necessario (cambiando season ovviamente)</li>
    <li>Il risultato è la rinomina automatica di episodi, in modo tale da essere più riconoscibili</li>
  </ul>
  </li>
</ul>
</p>

</html>









