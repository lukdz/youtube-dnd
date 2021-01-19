silent_background () {
    { 2>&3 "$@" & } 3>&2 2>/dev/null
    disown &>/dev/null
}

yt () {
	local url char url_array pid
    url_array=()
	silent_background youtube-dl --version
	pid=$!
	while true
	do
		url=""
		char=""
		while read -t 1 -n 1 -s -r char || [ -z "${url}" ]
		do
			url+="${char}"
			if [ "${#url_array[@]}" -ne 0 ] && ! ps -p "${pid}" > /dev/null
			then
				printf "\n"
				silent_background youtube-dl "${url_array[0]}"
				pid=$!
                url_array=("${url_array[@]:1}")
			fi
		done
		url_array+=("${url}")
		if ! ps -p "${pid}" > /dev/null
		then
			printf "\n[start] %s\n" "${url}"
		else
			printf "\n\n[queue %d] %s\n\n" "${#url_array[@]}" "${url}"
		fi
	done
}