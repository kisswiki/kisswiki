from https://github.com/can1357/oh-my-pi/issues/6451#issuecomment-5305656166

It works for me, but chatgpt says openai-codex does not support flex but openai-api does support it. But we can see the requests and responses.

## Create extension OMP for request and response hooks

~/.omp/agent/extensions/service-tier-debug.ts

```typescript
import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";

export default function serviceTierDebug(pi: ExtensionAPI) {
  pi.on("before_provider_request", async (event) => {
    if (
      event.provider !== "openai" ||
      !event.payload ||
      typeof event.payload !== "object"
    ) {
      return;
    }

    const serviceTier = (event.payload as Record<string, unknown>).service_tier;

    if (typeof serviceTier === "string") {
      pi.logger.info("service-tier", {
        serviceTier,
      });
    }
  });
}
```

## Configure OPENAI_API_KEY

```
$ cat ~/.omp/agent/.env
OPENAI_API_KEY=sk-...
```

Or here `~/.omp/.env`.

This should work too `export OPENAI_API_KEY="sk-..."`.

You could probably set OPENAI_API_KEY in ~/.omp/agent/models.yml with something like:

```yaml
providers:
  openai-api:
    baseUrl: "https://openai.com"
    api: "openai-completions"
    apiKey: "OPENAI_API_KEY"
    authHeader: true
```

## Set flex tier

`PI_REQ_DEBUG=1 omp --service-tier flex`

or with config, which will be layered on top of default `~/.omp/agent/config.yml`:

`PI_REQ_DEBUG=1 omp --config ~/.omp/agent/flex.yml`

```
$ cat ~/.omp/agent/flex.yml
tier:
  openai: flex
```

## Check request and reponse

After running omp, select some model `openai/...`, not `openai-code/...`.

Chat to model.

check for latest log files:

```
$ ls -ltr /tmp/rr-session-* 2>/dev/null | tail -2
```

Check if omp sends flex in request:

```
$ jq '.. | objects | select(has("service_tier")) | {service_tier}' \
  /tmp/rr-session-7.json
{
  "service_tier": "flex"
}
```

Check response from openai:

```
$ perl -pe 's/\\n/\n/g' /tmp/rr-session-7.res.log \
  | rg -o '"service_tier"\s*:\s*"[^"]+"'
"service_tier":"flex"
"service_tier":"flex"
"service_tier":"flex"
```
