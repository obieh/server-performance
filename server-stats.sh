#!/bin/bash
# Creator: Obieh
# Description: This script will display linux server statistics
# Date 01/03/2025
# Modification: None

line="............................................"
echo "Starting at: $(date)"; echo $line

echo "Total CPU Usage"; mpstat -P ALL; echo $line

echo "Total memory usage (Free vs Used including percentage)"; free; free | grep Mem | awk '{ printf("free: %.4f %\n", $4/$2 * 100.0) }'; echo $line

echo "Total disk usage (Free vs Used including percentage)"; df -h; echo $line

echo "Top 5 processes by CPU usage"; ps -eo pid,ppid,%cpu --sort=-%cpu | head -n 6; echo $line

echo "Top 5 processes by memory usage"; ps -eo pid,ppid,%mem --sort=-%mem | head -n 6; echo $line

echo "Finishing at: $(date)"