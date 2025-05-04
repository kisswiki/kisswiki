## RateLimitError: Error code: 429 - {'error': {'message': 'You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: <https://platform.openai.com/docs/guides/error-codes/api-errors>.', 'type': 'insufficient_quota', 'param': None, 'code': 'insufficient_quota'}}

I had 18$ but it expired. Here https://platform.openai.com/usage it showed 0$/18$.

I have added billing information for invoice <https://platform.openai.com/settings/organization/billing/overview>

- <https://community.openai.com/t/error-code-429-you-exceeded-your-current-quota-please-check-your-plan-and-billing-details/649547/15>
- <https://stackoverflow.com/questions/75898276/openai-api-error-429-you-exceeded-your-current-quota-please-check-your-plan-a>

## Example

<https://cookbook.openai.com/examples/gpt4-1_prompting_guide#example-prompt-customer-service>

I have used uv to install openai: `uv add ipykernel openai`.

I have run `uv venv`. Also in `windsurf > cmd+shift+p > Jupyter: Select Interpreter to Start Jupyter Server` and selected one in `.venv.`.
