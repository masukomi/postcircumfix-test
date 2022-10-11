# For simplicity of testing
# postcircumfix / slice will just return an array not an instance
# of the same class with the specified subset of its guts.
class Postcircumfix::Misc {
	has @.contents;
	method new (*@contents){ nextwith :@contents }
	submethod BUILD (:@!contents) {}
	# .slice is just going to return a List NOT a new Misc
    method slice(@indices) {
		@!contents[@indices];
    }
	# NOTE 2 parameter form
	# (Names uses 3 parameter form)
	multi sub postcircumfix:<[ ]>($object, *@indices) {
		constant &slicer = &postcircumfix:<[ ]>;
		($object ~~ Postcircumfix::Misc) ?? $object.slice(@indices) !! slicer($object, @indices);
	}


}
