#!/bin/bash

read_file_gracefully() {
	file_path=$1
	if [ -f "$file_path" ]; then
		echo "File content:"
		cat "$file_path"
	else
		echo "Error: File $file_path does not exist."
	fi
}

read -p "File path: " file_path

read_file_gracefully "$file_path"
