## Bool

Any -> Number -> Real -> Integer -> Bool

## Integer and Float Types

```mermaid
graph BT;
    UInt64 --> Unsigned;
    Int64 --> Signed;
    Unsigned --> Integer;
    Signed --> Integer;
    Integer --> Real;
    Float64 --> AbstractFloat;
    AbstractFloat --> Real;
    Real --> Number;
    Number --> Any;
```

## Char and String Types

```mermaid
graph BT;
    Char --> AbstractChar;
    AbstractChar --> Any;
    String --> AbstractString;
    AbstractString --> Any;
```

## Tuple and Array Types

```mermaid
graph BT;
    Tuple --> Any;
    Array --> DenseArray;
    DenseArray --> AbstractArray;
    AbstractArray --> Any;
```

### Tuple

- Stores a fixed number of items (not intended for large amount of items)
- Can store different types of values
- The parenthesis `()` are optional
- Immutable
- Order sensitive
- Starts from index **1**, not zero.

### Array

- Store any amount of values
- Must be homogeneous
- Multidimension supported (vector, matrix)
- Mutable
- Order sensitive

## Date, Time and DateTime Types

```mermaid
graph BT;
    Date --> TimeType;
    Time --> TimeType;
    DateTime --> AbstractDateTime;
    AbstractDateTime --> TimeType;
    TimeType --> AbstractTime;
    AbstractTime --> Any;
```
