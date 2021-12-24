stream optional
input_file required // optional or relative to $stream
output_file required // optional or relative to $stream
options optional

Run:

stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE="John Wick/Chapter2-Dual-Audio-2017.mkv" \
OUTPUT_FILE="John Wick/Chapter2-Dual-Audio-2017.mp4" \
  bash build_and_run.sh


IF you want to inspect:
stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mkv \
OUTPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mp4 \
INSPECT="true" \
  bash build_and_run.sh


If subtitle tag error run:
stream="/Users/riteshkumarchaurasia/Movies/Stream" \
INPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mkv \
OUTPUT_FILE=/Users/riteshkumarchaurasia/Movies/Stream/John\ Wick/Chapter3-Dual-Audio-2019.mp4 \
OPTIONS="-c:v copy -c:a copy -c:s:0 mov_text -map 0:a:0 -map 0:v:0 -map 0:a:1 -map 0:s:2" \
  bash build_and_run.sh

If inspect result is:
0:0 audio
0:1 video
0:2 audio
0:3 sub dvd
0:4 sub ind
0:5 sub eng

-c:v copy -c:a copy -c:s:0 mov_text -map 0:a:0 -map 0:v:0 -map 0:a:1 -map 0:s:2
This would mean:
-map 0:s:2 - select 0 input 3rd subtitle stream i.e. "0:5 sub eng"
-map 0:v:0 - select 0 input 1st video steam i.e. "0:1 video"
-c:v copy - copy all streams selected in map
-c:s:0 mov_text - select 1st subtitle stream which actually is (0:5 sub eng) because of (-map 0:s:2) and convert to mov_text

