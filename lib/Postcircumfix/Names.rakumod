class Postcircumfix::Names {
    has @.names;
    method new (*@names) { nextwith :@names }
    submethod BUILD (:@!names) {}
    method gist { @!names.join(', ') }
	method elems { @!names.elems }
}
multi sub postcircumfix:<[ ]> ( Postcircumfix::Names $n, $index, *@indices ) {
	Postcircumfix::Names.new: |$n.names[ |$index, |@indices ]
}
