# Railway CLI (via Github Releases) (railway-cli)

Railway CLI allows you to interact with the Railway API via the command line

## Example Usage

```json
"features": {
    "ghcr.io/freshcodes/devcontainer-features/railway-cli:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the Railway CLI version you would like to install | string | latest |

## Authentication

After the container starts, authenticate with Railway:

```bash
railway login
```

## Documentation

For complete Railway CLI documentation and commands, visit:
- [Railway CLI Documentation](https://docs.railway.app/reference/cli-api)
- [Railway CLI Quick Start](https://docs.railway.app/quick-start)

For all available commands and options, run:
```bash
railway --help
```