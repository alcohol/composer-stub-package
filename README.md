# stub composer package

Simple Docker container that hosts a stub Composer package that can be accessed over http and http + basic auth. Mostly
just for debugging and testing purposes.

## sample project composer.json

You can use the following `composer.json` to use the hosted packaged:

```json
{
    "repositories": [{
        "type": "git",
        "url": "http://localhost:8000/no-auth"
    }, {
        "packagist": false
    }],
    "require": {
        "foo/bar": "1.0.0"
    },
    "config": {
        "secure-http": false
    }
}
```

> Note: you can substitute `/no-auth` with `/basic-auth` to test basic authentication.
> The basic authentication credentials are `username` and `password`.
