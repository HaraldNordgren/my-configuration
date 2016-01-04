for i in {1..100}; do
    printf "%s\r" "Progress: $i%"
    sleep 0.05
done

echo
