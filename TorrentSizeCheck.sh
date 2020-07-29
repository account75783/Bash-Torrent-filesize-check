totalsize=0
megabytes=0
gigabytes=0
size=0
dir="$1"
if [ -d "${dir}" ] ; then
for entry in "$dir"/*.torrent
do
count=$((count + 1))
echo "file $count"
echo "$entry"
size=$(head -1 "$entry" | grep -aoE '6:lengthi[0-9]+' | cut -di -f2 | awk '{s+=$1} END {print s}')
megabytes=$((size / 1048576))
gigabytes=$((size / 1073741824))
totalsize=$((totalsize + megabytes))
echo "Torrent size: $megabytes MB ~ $gigabytes GB"
done
fi
if [ -f "${dir}" ] ; then
size=$(head -1 "$dir" | grep -aoE '6:lengthi[0-9]+' | cut -di -f2 | awk '{s+=$1} END {print s}')
megabytes=$((size / 1048576))
gigabytes=$((size / 1073741824))
totalsize=$((totalsize + megabytes))
echo "Torrent size: $megabytes MB ~ $gigabytes GB"
fi
echo "Size of all torrents listed $totalsize MB"
