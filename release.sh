out=/tmp/gfdmlibrel
rel=GFDMlib_TUD.zip

mkdir $out
cp -r gfdmlib examples $out
cp setPath.m $out
cp license.txt $out

cd $out
zip -r ./$rel *
cd -

cp $out/$rel .

rm -r $out
