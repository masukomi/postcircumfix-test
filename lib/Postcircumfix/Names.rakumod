class Postcircumfix::Names {
    has @.names;
    method new (*@names) { nextwith :@names }
    submethod BUILD (:@!names) {}
    method gist { @!names.join(', ') }
	method elems { @!names.elems }
}

# NOTE: 3 parameter form
# (Misc uses 2 parameter form)
multi sub postcircumfix:<[ ]> ( Postcircumfix::Names $n, $index, *@indices ) is export {
	Postcircumfix::Names.new: |$n.names[ |$index, |@indices ]
}
