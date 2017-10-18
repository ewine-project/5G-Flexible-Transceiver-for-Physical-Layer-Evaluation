directories="gfdmlib examples"
for d in $directories; do
    for f in `find $d -name "*.m"`; do
	head -n 1 $f | grep "TU Dresden" > /dev/null
	if [ $? -ne 0 ]; then
	    echo "Modifying $f..."
	    cat licenseHeader.txt $f > /tmp/bla.txt
	    cp /tmp/bla.txt $f
	fi
    done
done
