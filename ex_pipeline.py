import math


def add(a: int | float, b: int | float) -> int | float:
    return a + b


def divide(a: int | float, b: int | float) -> float:
    if not math.isfinite(b):
        raise ValueError(f"divisor must be a finite number, got {b!r}")
    if b == 0:
        raise ValueError(f"division by zero: b={b!r}")
    return a / b
