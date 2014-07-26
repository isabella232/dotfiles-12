# ENV var to prevent spawning tmux
if [ ! $skip_tmux ]; then
  # Check if we already are in tmux
  if [ ! $TMUX ]; then
    session=$(tmux list-sessions | awk -F':' '/[^\(attached\)]$/ {print $1; exit}')
    if [ "x$session" != "x" ]; then
      # If a session is detached, attach it
      exec tmux attach -t $session
    else
      # Or create a new one
      exec tmux
    fi
  fi
fi
