using PyCall

py"print('hello from Python')"

total = py"2 + 3"
typeof(total)

# Get the actual executable of Python used by PyCall
PyCall.python |> println

# To install a python module, copy the path,
# cd into it with command line and type
# python -m pip install <your-package>

py_clean = pyimport("cleantext")

py_clean.clean("h€ello") |> println

# Defining a Python function
py"""
from cleantext import clean

def custom_clean(x: str):
    return clean(f'cleaned text: {x}')
"""

py"custom_clean"("»Yóù àré     rïght &lt;3!«") |> println
