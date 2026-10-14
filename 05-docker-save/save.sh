docker save $1 -o ./$2.tar

DIR=$2/blobs/sha256
mkdir -p "$2"
tar -xf "$2.tar" -C "$2"
for f in "$DIR"/*; do
  if find $f -size +1M -print -quit | grep -q .; then
    tar -xzf "$f" -C "$f"
    open -a "Archive Utility" $f
  fi
done
