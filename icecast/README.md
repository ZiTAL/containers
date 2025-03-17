# edit icecast.xml

# stream to icecast server
```
ffmpeg -re -i input.mp3 -acodec libmp3lame -b:a 128k -content_type audio/mpeg -f mp3 icecast://source:12345@localhost:8000/stream.mp3
ffmpeg -re -i input.mp3 -acodec libvorbis  -b:a 128k -content_type audio/ogg  -f ogg icecast://source:12345@localhost:8000/stream.ogg
```