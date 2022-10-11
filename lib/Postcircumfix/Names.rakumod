class Postcircumfix::Names {
    has @.names;
    method new (*@names) { nextwith :@names }
    submethod BUILD (:@!names) {}
    multi sub postcircumfix:<[ ]> ( $n, $index, *@indices ) is default is export {
		new: |$n.names[ |$index, |@indices ]
	}
    method gist { @!names.join(', ') }
	method elems { @!names.elems }
}
