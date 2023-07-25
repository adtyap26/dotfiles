#!/bin/bash

SESSIONS_FILE="/tmp/tmux_sessions"

function run_st() {
    local st_command="st -e bash -c"
    local command="$1"
    $st_command "$command"
}

function list_sessions() {
    tmux list-sessions > "$SESSIONS_FILE"
    local selected_session=$(cat "$SESSIONS_FILE" | rofi -dmenu -p "Tmux Sessions:" | awk '{print $1}')
    if [ -n "$selected_session" ]; then
        run_st "tmux attach-session -t $selected_session"
    fi
    rm "$SESSIONS_FILE"
}

function create_session() {
    local session_name=$(rofi -dmenu -p "Enter a name for the new session:")
    if [ -n "$session_name" ]; then
        run_st "tmux new-session -d -s $session_name && tmux attach-session -t $session_name"
    fi
}

function delete_session() {
    tmux list-sessions > "$SESSIONS_FILE"
    local selected_session=$(cat "$SESSIONS_FILE" | rofi -dmenu -p "Select a session to delete:" | awk '{print $1}')
    if [ -n "$selected_session" ]; then
        tmux kill-session -t "$selected_session"
        rofi -e "Session deleted: $selected_session"
    fi
    rm "$SESSIONS_FILE"
}

function main_menu() {
    local options=("List Sessions" "Create New Session" "Delete Session" "Exit")
    local selection=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Choose an action:")
    case "$selection" in
        "List Sessions")
            list_sessions
            ;;
        "Create New Session")
            create_session
            ;;
        "Delete Session")
            delete_session
            ;;
        "Exit")
            exit 0
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}

main_menu

