"""Stable banner formatting used by the drift-guard example."""


def render_banner(title: str) -> str:
    normalized = " ".join(title.split())
    return f"## {normalized} ##"

