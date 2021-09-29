#!/bin/bash

# edit $1 modules to be executable with python 3.6

sed -i 's/python_requires = >= 3\.[0-9]/python_requires = >= 3.6/g' setup.cfg # use python 3.6 in setup.cfgsed -i 's/python_requires = >= 3\.[0-9]/python_requires = >= 3.6/g' setup.cfg # use python 3.6 in setup.cfg
sed -i 's/from __future__ import annotations//g' $(find $1/ -name "*.py" | grep -v tree) # remove import annotations
sed -ri 's/= NewType.*/= None/g' $(find $1/ -name "*.py" | grep -v tree) # remove NewType creation
sed -i 's/: *[[:alnum:]]* *=/=/g' $(find $1/ -name "*.py" | grep -v tree) # remove variable type annotations
sed -ri 's/: Callable\[\[([a-zA-Z]*, )*[a-zA-Z]*\], [a-zA-Z]*\]//g' $(find $1/ -name "*.py" | grep -v tree) # remove Callable type annotations
sed -i 's/ *-> *[[:alnum:]]*:/:/g' $(find $1/ -name "*.py" | grep -v tree) # remove return type
sed -ri 's/: [a-zA-Z]*\[[a-zA-Z]*, [a-zA-Z]*\]//g' $(find $1/ -name "*.py" | grep -v tree) # remove method parameters type annotations with complex types (Ðict[A, B])
sed -ri 's/(, [a-zA-Z0-9_]*): [a-zA-Z\[]*\]?/\1/g' $(find $1/ -name "*.py" | grep -v tree) # remove method parameters type annotations
sed -ri 's/\(([a-zA-Z0-9_]*): [a-zA-Z\[]*\]?,/\(\1,/g' $(find $1/ -name "*.py" | grep -v tree) # remove first method parameter annotation
sed -ri 's/\(([a-zA-Z0-9_]*): [a-zA-Z\[]*\]?\)/\(\1\)/g' $(find $1/ -name "*.py" | grep -v tree) # remove alone method parameter annotations (fun(a: A))
