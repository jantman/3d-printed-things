#!/bin/bash
# This optionally depends on admesh: https://github.com/admesh/admesh/
# if you want your STL files to be automatically fixed (as well as admesh can)

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

scadfile=$(mktemp --suffix=.scad)
outfile=$(mktemp --suffix=.stl)
ADMESH_BIN=$(which admesh)
function finish {
  rm -f $scadfile $outfile
}
trap finish EXIT

failed=""

shopt -s globstar
for i in **/*.stl; do # Whitespace-safe and recursive
    fpath=$(readlink -f "$i")
    if [[ "$(file $fpath)" == *ASCII\ text ]]; then
      echo "Checking $i (ASCII)"
      [ "$ADMESH_BIN" != "" ] && admesh --write-ascii-stl=$fpath $fpath
    else
      echo "Checking $i (binary)"
      [ "$ADMESH_BIN" != "" ] && admesh --write-binary-stl=$fpath $fpath
    fi
    # NOTE: Most OpenSCAD render-time issues that I've seen are likely caused by bugs/missing features
    # for handling co-incident faces, or because OpenSCAD silently imports "bad" STL. E.g. see
    # https://github.com/openscad/openscad/issues/791 https://github.com/openscad/openscad/issues/2847 etc.
    # The IMPORTANT part is that these issuses don't show up in preview, and also don't show up in standalone
    # usage of the STL file, or with simple operations. HOWEVER, they *do* show up when 3D operations such as
    # union/intersection/difference are performed, because that's when CGAL compilation comes into play.
    #
    # The following example SCAD file attempts some 3D CGAL operations on the STL file to see if they fail.
    # This can be a good way of finding bad STL files.
    #
    # It's still entirely possible, and likely, to trigger the conicident faces bug ourselves in code that we write,
    # but that's our own problem to solve.
    cat <<EOF > $scadfile
translate([-392,285.5,0]){
    rotate([-90,0,-90]){
        color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {
            import("${fpath}");
        }
    }
}
union() {
    translate([-392,285.5,0]){
        rotate([-90,0,-90]){
            color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {
                import("${fpath}");
            }
        }
    }
    cube([20,20,20],false);
}
intersection() {
    translate([-392,285.5,0]){
        rotate([-90,0,-90]){
            color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {
                import("${fpath}");
            }
        }
    }
    cube([20,20,20],false);
}
difference() {
    translate([-392,285.5,0]){
        rotate([-90,0,-90]){
            color([0.2862745225429535, 0.6627451181411743, 0.2862745225429535, 0.5]) {
                import("${fpath}");
            }
        }
    }
    cube([20,20,20],false);
}
EOF
    echo ">>> ${scadfile}:"
    cat $scadfile
    echo "EXECUTE: openscad --hardwarnings -o $outfile $scadfile"
    if ! openscad --hardwarnings -o $outfile $scadfile
    then
      echo "FAILED: ${i}"
      failed="${failed}\n${i}"
      continue
    fi
done

echo "FAILED STL FILES:"
echo -e $failed
