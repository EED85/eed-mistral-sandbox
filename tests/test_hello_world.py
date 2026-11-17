from pathlib import Path

from eed_package_template import hello_world


def test_hello_world(cfg_test: dict[str, Path]) -> None:
    result = hello_world()
    assert "Hello from" in result, (
        "Greeting message should start with 'Hello from'"
    )
    assert str(cfg_test["git_root"]) in result
