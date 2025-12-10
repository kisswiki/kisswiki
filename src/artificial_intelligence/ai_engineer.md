## 2025-12-10 22:48

1. ogolne LLMy podstawy, ogarniecie jak to dziala DeepLearning.AI "Building Systems with the ChatGPT API"

2. RAGi i frameworki to po prostu trzeba nauczyc sie ktoregos frameworku (LangChain + LangGraph: to z LangChain docs; LangGraph quickstart - grafy bazowe jakies; LlamaIndex "Starter Tutorial (Using OpenAI)"; jakies blogi i tutoriale

backendy to np fajna ksiakza Designing Data-Intensive Applications, GitHub "The System Design Primer"

framework po p[orstu wybiera sie jeden i uczy do poziomu produkcyjnego Framework (wybierz 1 i dociagnij do poziomu produkcyjnego):
np takie fw.
python: FastAPI + SQLAlchemy + Postgres + Redis + Celery/worker

TS: NestJS + Postgres + Redis + bullmq
Natalia Frołow córka forwarded a message
iMO kluczowe kluczowe:

testy (unit + integracyjne),
migrationy DB,
konfiguracja przez env,
observability: logi, metrics, trace (np. Prometheus + Grafana, albo jakis managed stack),
feature flags / toggles, rollouty,
hardening: rate limiting, auth, input validation
