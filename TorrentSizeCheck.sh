totalsize=0
megabytes=0
gigabytes=0
size=0
dir="$1"
for entry in "$dir"/*.torrent
do
count=$((count + 1))
echo "file $count"
echo "$entry"
size=$(head -1 "$entry" | grep -aoE '6:lengthi[0-9]+' | cut -di -f2 | awk '{s+=$1} END {print s}')
megabytes=$((size / 1000000))
gigabytes=$((size / 1000000000))
totalsize=$((totalsize + gigabytes))
echo "Torrent size: $megabytes MB ~ $gigabytes GB"
done
echo "Size of all torrents listed $totalsize GB"
