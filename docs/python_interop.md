## Julia Calling Python

Julia can call Python codes with the `PyCall` wrapper that can be installed from the general registry.

Code examples are can be seen at `src/interop/python.jl`.

## Python Calling Julia

Python can call Julia codes similar to how Julia can call Python codes. The wrapper for Julia can be installed via `pip`.

```
python -m pip install julia
```

Next, import the Julia object and configure the compiler settings via the constructor.

```py
from julia.api import Julia

j = Julia(compiled_modules=False)
```

Use `eval` to evaluate an inline Julia code enclosed in a string.

```py
j.eval('println("Hello")')
```

### Defining Julia Function

Julia functions can be defined within an `eval` as shown below.

```py
j.eval("""
    inc(x) = x + 1
""")
```

Use the `Main` object to invoke the defined function like a method as shown.

```py
from julia import Main

print(f'{Main.inc(3)}')
```

### Benchmarking Performance

As counterintuitive as it is, executing Python code from Python itself actually is slower than executing Julia code from Python as Julia is renowned for its performance.

```py
from timeit import Timer

def f_python():
    i = 0
    while i < 10000:
        if i == 9999:
            return i
        i += 1

j.eval("""
function f_julia()
    i = 0
    while i < 10000
        if i == 9999
            return i
        end
        i += 1
    end
end
""")

print(f'Python {Timer(f_python).timeit(number=100000):.2f} seconds')
print(f'Julia {Timer(Main.f_julia).timeit(number=100000):.2f} seconds')
```
