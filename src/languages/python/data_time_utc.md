```python
import platform
o_timestamp = datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S")
o_timestamp2 = datetime.utcnow().isoformat().rsplit('.', 1)[0]+'Z'
```

- https://stackoverflow.com/questions/2150739/iso-time-iso-8601-in-python
- https://stackoverflow.com/questions/19654578/python-utc-datetime-objects-iso-format-doesnt-include-z-zulu-or-zero-offset/55157458#55157458
- https://stackoverflow.com/questions/2331592/why-does-datetime-datetime-utcnow-not-contain-timezone-information
- https://stackoverflow.com/questions/3548673/how-to-replace-or-strip-an-extension-from-a-filename-in-python/40671090#40671090
