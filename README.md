# claude-code-guide-practice

Claude Code 가이드 실습 프로젝트입니다.

## 함수 목록

### `add(a, b)`

```python
def add(a: int | float, b: int | float) -> int | float
```

두 수를 더해 반환합니다.

**예시**

```python
from ex_pipeline import add

add(1, 2)      # 3
add(1.5, 2.5)  # 4.0
add(-3, 5)     # 2
```

---

### `divide(a, b)`

```python
def divide(a: int | float, b: int | float) -> float
```

`a`를 `b`로 나눈 결과를 `float`으로 반환합니다.

**예외**

| 조건 | 예외 |
|------|------|
| `b == 0` | `ValueError: division by zero: b=0` |
| `b`가 `inf` 또는 `nan` | `ValueError: divisor must be a finite number, got ...` |

**예시**

```python
from ex_pipeline import divide

divide(10, 2)          # 5.0
divide(7.5, 2.5)       # 3.0
divide(-9, 3)          # -3.0

divide(1, 0)           # ValueError: division by zero: b=0
divide(1, float("inf"))  # ValueError: divisor must be a finite number, got inf
divide(1, float("nan"))  # ValueError: divisor must be a finite number, got nan
```

## 테스트 실행

```bash
pytest
```
