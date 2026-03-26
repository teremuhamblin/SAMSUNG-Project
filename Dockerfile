# ============================
#  Stage 1 — Build API Python
# ============================
FROM python:3.11-slim AS api-builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src ./src
COPY data ./data

# ============================
#  Stage 2 — Build static site
# ============================
FROM openjdk:21-slim AS java-builder

WORKDIR /site

COPY tools/StaticSiteGenerator.java .
COPY docs ./docs

RUN javac StaticSiteGenerator.java
RUN java StaticSiteGenerator

# ============================
#  Stage 3 — Final image
# ============================
FROM nginx:latest

# API
COPY --from=api-builder /app /app

# Site statique
COPY --from=java-builder /site/public /usr/share/nginx/html

# Expose ports
EXPOSE 80
EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
