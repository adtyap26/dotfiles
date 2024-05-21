#!/bin/bash

function run_terminal() {
    local term_command="alacritty -e bash -c"
    local command="$1"
    $term_command "$command"
}

function ask_restore_session() {
    local choice=$(echo -e "Yes\nNo" | rofi -dmenu -p "Do you want to restore the session?")
    if [ "$choice" = "Yes" ]; then
        tmux new-session -d &
    else
        exit 0
    fi
}

function list_sessions() {
    local selected_session=$(tmux list-sessions | rofi -dmenu -p "Tmux Sessions:" | awk '{print $1}')
    if [ -n "$selected_session" ]; then
        run_terminal "tmux attach-session -t $selected_session"
    fi
}

function create_session() {
    local session_name=$(rofi -dmenu -p "Enter a name for the new session:")
    if [ -n "$session_name" ]; then
        run_terminal "tmux new-session -d -s $session_name && tmux attach-session -t $session_name"
    fi
}

function delete_session() {
    local selected_session=$(tmux list-sessions | rofi -dmenu -p "Select a session to delete:" | awk '{print $1}')
    if [ -n "$selected_session" ]; then
        tmux kill-session -t "$selected_session"
        notify-send "Session deleted: $selected_session"
    fi
}

function main_menu() {
    ask_restore_session

    while true; do
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
    done
}

main_menu

