import pytest

from ex_pipeline import add, divide


def test_add_integers() -> None:
    assert add(1, 2) == 3


def test_add_floats() -> None:
    assert add(1.5, 2.5) == pytest.approx(4.0)


def test_add_negative() -> None:
    assert add(-3, 5) == 2


def test_add_zero() -> None:
    assert add(0, 0) == 0


def test_divide_integers() -> None:
    assert divide(10, 2) == pytest.approx(5.0)


def test_divide_floats() -> None:
    assert divide(7.5, 2.5) == pytest.approx(3.0)


def test_divide_negative() -> None:
    assert divide(-9, 3) == pytest.approx(-3.0)


def test_divide_by_zero() -> None:
    with pytest.raises(ValueError, match="division by zero"):
        divide(1, 0)


def test_divide_by_nan() -> None:
    with pytest.raises(ValueError, match="finite number"):
        divide(1, float("nan"))


def test_divide_by_inf() -> None:
    with pytest.raises(ValueError, match="finite number"):
        divide(1, float("inf"))
