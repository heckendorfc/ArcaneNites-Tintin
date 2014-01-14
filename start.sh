#!/bin/sh

rm affects
mkfifo affects

rm cstats
mkfifo cstats

rm gstats
mkfifo gstats

#tmux new-session -s an 'tail -f chat' \;\
	#splitw -v -p 85 "tt++ -r $1" \;\
	#selectp -t1 \;\
	#attach

tmux new-session -s an 'tail -f chat' \;\
	splitw -h -l 80 'tail -f affects' \;\
	splitw -v -l 15 'tail -f cstats' \;\
	selectp -t 0 \;\
	splitw -v -p 85 "tt++ -r $1" \;\
	selectp -t1 \;\
	attach
