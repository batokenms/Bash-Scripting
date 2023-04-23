#!/bin/bash

# Create directories if they don't exist
command -v dir1 >/dev/null 2>&1 || mkdir dir1 && chmod 777 dir1
command -v dir2 >/dev/null 2>&1 || mkdir dir2 && chmod 777 dir2
command -v dir3 >/dev/null 2>&1 || mkdir dir3 && chmod 777 dir3

# Create files if they don't exist
command -v file1.txt >/dev/null 2>&1 || touch file1.txt && chmod 777 file1.txt
command -v file2.txt >/dev/null 2>&1 || touch file2.txt && chmod 777 file2.txt
command -v file3.txt >/dev/null 2>&1 || touch file3.txt && chmod 777 file3.txt
