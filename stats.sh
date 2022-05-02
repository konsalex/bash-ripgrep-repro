# Count of all "imports" and "exports" in projects (exports is used in Aura)
rg -c --pcre2 "^(import|export).+(\"|\')@neo4j-ndl\/react(\"|\')" | wc -l

# How many diff repos are using it
# find imports >
# grab the path lines >
# get the first dir of the path (repo name) >
# count the unique dirs
all_repos=$(rg --pcre2 "^(import|export).+(\"|\')@neo4j-ndl\/react(\"|\')" |
awk 'NR % 3 == 0' |
rg --only-matching --pcre2 "^[^\/]*" |
sort |
uniq)

echo $all_repos

all_repos_count=$(echo $all_repos | wc -w)

echo $all_repos_count

# Total repos tracked
total_repos=$(ls -d -- */ | wc -l)

echo "${all_repos_count} out of ${total_repos} tracked"

