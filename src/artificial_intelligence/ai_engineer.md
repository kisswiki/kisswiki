## 2025-12-10 22:48

1. ogólne LLMy podstawy, ogarnięcie jak to działa https://DeepLearning.AI "Building Systems with the ChatGPT API"

2. RAGi i frameworki to po prostu trzeba nauczyć się któregoś frameworku (LangChain + LangGraph: to z LangChain docs; LangGraph quickstart - grafy bazowe jakieś; LlamaIndex "Starter Tutorial (Using OpenAI)"; jakieś blogi i tutoriale

backendy to np fajna książka Designing Data-Intensive Applications (Przetwarzanie danych w dużej skali), GitHub "The System Design Primer" https://github.com/donnemartin/system-design-primer

framework po prostu wybiera się jeden i uczy do poziomu produkcyjnego Framework (wybierz 1 i dociągnij do poziomu produkcyjnego):
np takie fw.
python: FastAPI + SQLAlchemy + Postgres + Redis + Celery/worker

TS: NestJS + Postgres + Redis + bullmq

IMO kluczowe kluczowe:

testy (unit + integracyjne),
migrationy DB,
konfiguracja przez env,
observability: logi, metrics, trace (np. Prometheus + Grafana, albo jakiś managed stack),
feature flags / toggles, rollouty,
hardening: rate limiting, auth, input validation

https://www.linkedin.com/in/naithai/recent-activity/all/

https://github.com/natiixnt?tab=repositories

https://www.udemy.com/course/llm-engineering-master-ai-and-large-language-models/learn/lecture/52932169#overview

`brew install --cask ollama-app`

https://learn.deeplearning.ai/courses/advanced-retrieval-for-ai/lesson/ukzj4/overview-of-embeddings-based-retrieval
