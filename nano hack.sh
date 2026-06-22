#!/bin/bash

# Kitne commits per day aur kitne din
COMMITS_PER_DAY=5
START_DATE="2025-01-01"  # apni date change karo

current_date=$(date -d "$START_DATE" +%Y-%m-%d)

for i in {1..365}; do  # 1 saal ke liye
    for j in $(seq 1 $COMMITS_PER_DAY); do
        echo "Fake commit $j on $current_date" >> contributions.txt
        GIT_AUTHOR_DATE="$current_date 12:00:00" \
        GIT_COMMITTER_DATE="$current_date 12:00:00" \
        git commit --allow-empty -m "Contribution on $current_date" -a --date="$current_date 12:00:00"
    done
    current_date=$(date -d "$current_date +1 day" +%Y-%m-%d)
done

git push origin main
