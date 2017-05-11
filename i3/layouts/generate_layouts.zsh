for ((i = 1; i <= 10; i++)); do
    i3-save-tree --workspace $i | tail -n +2 | fgrep -v '// splitv' | sed 's|//||g' > ${1}workspace_${i}.json;
done
