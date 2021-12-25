## Env Variables
- stream - Path which will be mounted to docker container
- INPUT_FILE - Absolute path of the file inside container or relative to $stream
- OUTPUT_FILE - Absolute path of the file inside container or relative to $stream
- OPTIONS - Any options you want to give to ffmpeg
- INSPECT - Whether you only want to inspect the file
<br />

#### Examples

###### Simple example
```
stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE="John Wick/Chapter2-Dual-Audio-2017.mkv" \
OUTPUT_FILE="John Wick/Chapter2-Dual-Audio-2017.mp4" \
  bash run.sh
```

###### If you just want to inspect a file run like this:
```
stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mkv \
INSPECT="true" \
  bash run.sh
```

###### Example using Options:
```
Assuming your input file has this config (You may inspect it):
0:0 audio
0:1 video
0:2 audio
0:3 sub dvd
0:4 sub ind
0:5 sub eng

stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mkv \
OUTPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mp4 \
OPTIONS="-c:v copy -c:a copy -c:s:0 mov_text -map 0:a:0 -map 0:v:0 -map 0:a:1 -map 0:s:2" \
  bash run.sh
```

###### Explanation:
- `-map 0:s:2` - select 0 input 3rd subtitle stream i.e. "0:5 sub eng"
- `-map 0:v:0` - select 0 input 1st video steam i.e. "0:1 video"
- `-c:v copy` - copy all streams selected in map
- `-c:s:0 mov_text` - select 1st subtitle stream which actually is (0:5 sub eng) because of (-map 0:s:2) and convert to `mov_text`
