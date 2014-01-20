#!/bin/sh

rm affects
mkfifo affects

rm cstats
mkfifo cstats

rm gstats
mkfifo gstats

rm minimap
mkfifo minimap

rm ttmap
mkfifo ttmap

#tmux new-session -s an 'tail -f chat' \;\
	#splitw -v -p 85 "tt++ -r $1" \;\
	#selectp -t1 \;\
	#attach

tmux new-session -s an 'tail -f chat' \;\
	splitw -h -l 80 'tail -f affects' \;\
	splitw -v -l 15 'tail -f cstats' \;\
	splitw -h -l 15 'tail -f minimap' \;\
	selectp -t 3 \;\
	splitw -h -l 30 'tail -f ttmap' \;\
	selectp -t 0 \;\
	splitw -v -p 85 "tt++ -r $1" \;\
	selectp -t1 \;\
	attach
