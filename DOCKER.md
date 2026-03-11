# 🐳 OrderChecker v5.0 - Docker Сборка и Запуск

## 🎯 Что это?

Docker позволяет собрать **Linux версию** на **macOS** (или Windows) и запустить приложение в контейнере.

---

## 🔧 Сборка Linux бинарника через Docker

### Быстрая сборка (ОДНА КОМАНДА)

```bash
cd OrderChecker_DEPLOY
bash docker-build.sh
```

**Результат:**
- 📁 `docker-dist/OrderChecker` - Linux бинарник
- 🐳 `orderchecker:latest` - Docker образ (опционально)

---

## 📦 Ручная сборка (пошагово)

### Шаг 1: Сборка build образа

```bash
docker build -f Dockerfile.build -t orderchecker-build .
```

### Шаг 2: Извлечение бинарника

```bash
mkdir -p docker-dist
docker run --rm -v "$(pwd)/docker-dist:/dist" orderchecker-build \
  bash -c "cp /app/dist/OrderChecker /dist/"
```

### Шаг 3: Результат

```bash
ls -lh docker-dist/OrderChecker
# Linux бинарник готов!
```

---

## 🚀 Запуск в Docker

### ВАРИАНТ 1: Из готового образа

```bash
# Сборка runtime образа
docker build -f Dockerfile.run -t orderchecker:latest .

# Запуск
docker run -it --rm orderchecker:latest
```

### ВАРИАНТ 2: С монтированием файлов

```bash
# Монтирование папки с документами
docker run -it --rm \
  -v /path/to/documents:/files \
  orderchecker:latest
```

### ВАРИАНТ 3: С X11 (GUI на хосте)

```bash
# Linux: прямая передача X11
docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  orderchecker:latest

# macOS: через XQuartz
xhost +localhost
docker run -it --rm \
  -e DISPLAY=host.docker.internal:0 \
  orderchecker:latest
```

---

## 📁 Структура Docker файлов

```
OrderChecker_DEPLOY/
├── Dockerfile.build     # Сборка бинарника
├── Dockerfile.run        # Runtime контейнер
├── entrypoint.sh        # Скрипт запуска в контейнере
├── docker-build.sh      # Автоматическая сборка
└── docker-dist/         # Результат сборки
    └── OrderChecker     # Linux бинарник
```

---

## 🎯 Docker команды

| Команда | Описание |
|---------|----------|
| `docker build -f Dockerfile.build -t build .` | Сборка build образа |
| `docker run --rm build cat /app/dist/OrderChecker > OrderChecker` | Извлечение бинарника |
| `docker build -f Dockerfile.run -t orderchecker .` | Сборка runtime образа |
| `docker run -it --rm orderchecker` | Запуск приложения |

---

## 🔍 Troubleshooting

### Проблема: "Cannot connect to X server"

**Решение (Linux):**
```bash
xhost +
```

**Решение (macOS + XQuartz):**
```bash
# Запустите XQuartz
xhost +localhost
```

### Проблема: "Binar y too large"

**Решение:** Используйте UPX сжатие
```bash
upx --best --lzma docker-dist/OrderChecker
```

### Проблема: "Docker daemon not running"

**Решение:**
```bash
# macOS
open -a Docker

# Linux
sudo systemctl start docker
```

---

## 📊 Размеры

| Компонент | Размер |
|-----------|--------|
| build образ | ~2GB |
| runtime образ | ~200MB |
| Linux бинарник | ~100MB |

---

## 🎉 Готово!

После сборки у вас есть:

1. **Linux бинарник** в `docker-dist/OrderChecker`
2. **Docker образ** `orderchecker:latest`

Оба работают на Linux без установки Python!
