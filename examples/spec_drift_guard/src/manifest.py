"""Parse simple key/value metadata lines."""


def parse_manifest_line(line: str):
    text = line.strip()
    if not text or text.startswith("#"):
        raise ValueError("Manifest lines must contain key/value data")

    for separator in ("=", ":", "|"):
        if separator in text:
            key, value = text.split(separator, 1)
            key = key.strip()
            value = value.strip()
            if not key or not value:
                break
            return key, value

    raise ValueError("Manifest lines must contain key/value data")

