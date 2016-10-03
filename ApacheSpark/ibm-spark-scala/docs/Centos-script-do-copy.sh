declare -a nodes=(
"h1.aw.com"
"h2.aw.com"
"h3.aw.com"
"h4.aw.com"
"h5.aw.com"
)


for i in "${nodes[@]}"
do
    scp "$1" "$i":"$1"
done

