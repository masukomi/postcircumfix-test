Postcircumfix bug test
====

This repo only exists in support of [a bug I think I've stumbled across in Rakudo](https://github.com/rakudo/rakudo/issues/3799).

Postcircumfix::Misc the simpler class exhibiting the problem
- `slice` just returns a "sliced" `List` of the guts of the thing 
- the `postcircumfix` method is written with 2 parameters.

Postcircumfix::Names is a slightly more complex example of a real-world style usage.
- `slice` returns a new class instance with the sliced guts of the original instance.
- the `postcircumfix` method is written with 3 parameters;

The `t/01-basic.rakutest` demonstrates the problem of the seemingly unavoidable error 

```
Index out of range. Is: 1, should be in 0..0
```

Note that this doesn't happen when you call the `postcircumfix` method but when you actually try and leverage the results of it. It seems as if `postcircumfix`` is somehow invoked lazily. 

From other tests I've performed I believe that the error being thrown has nothing to do with the _contents_ of the `postcircumfix` method _or_ if it is the 2 or 3 parameter version.
