icon="🌡"
cpu_temp="$(sensors | grep -m 1 temp1 | awk '{gsub(/\+/,"")}1''{print $2}')"
echo "${icon} ${cpu_temp}"
