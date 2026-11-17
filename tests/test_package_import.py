import importlib
import tomllib
from pathlib import Path


def test_package_import() -> None:
    project_file = Path(__file__).parents[1] / "pyproject.toml"
    project = tomllib.loads(project_file.read_text(encoding="utf-8"))
    module_path = project["project"]["scripts"]["hello_world"].partition(":")[0]
    package_name = module_path.partition(".")[0]

    package = importlib.import_module(package_name)

    assert package.__file__ is not None
