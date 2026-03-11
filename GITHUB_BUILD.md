# 🚀 GitHub Actions - Сборка Linux версии БЕСПЛАТНО

## 🎯 Что это?

GitHub Actions соберёт **Linux бинарник** на своих серверах **бесплатно**!

---

## 📋 Инструкция (5 минут)

### Шаг 1: Создайте репозиторий на GitHub

1. Зайдите на https://github.com/new
2. Назовите: `OrderChecker`
3. Сделайте **Public**
4. Создайте репозиторий

### Шаг 2: Загрузите файлы

**Вариант А: Через веб-интерфейс**
1. Откройте созданный репозиторий
2. Нажмите "uploading an existing file"
3. Перетащите ВСЮ папку `OrderChecker_DEPLOY`

**Вариант Б: Через git (если установлен)**
```bash
cd OrderChecker_DEPLOY
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/ВАШ_ЮЗЕРНЕЙМ/OrderChecker.git
git push -u origin main
```

### Шаг 3: Запустите сборку

1. Откройте репозиторий на GitHub
2. Перейдите в **Actions** (вкладка сверху)
3. Выберите **"Build OrderChecker Linux"**
4. Нажмите **"Run workflow"** → **"Run workflow"**

### Шаг 4: Скачайте готовый файл

1. Подождите 2-3 минуты
2. В списке runs нажмите на сборку
3. Внизу раздел **Artifacts** → **OrderChecker-linux-x64**
4. Скачайте ZIP архив
5. Распакуйте - внутри `OrderChecker-linux` - готовый Linux бинарник!

---

## ✅ Что получаете:

- 🐧 **Linux бинарник** (x86_64)
- 📦 ~100MB размер
- ⚡ Работает на любом Linux без Python

---

## 🎯 Кнопка быстрого запуска (опционально)

Добавьте `README.md` в репозиторий:

```markdown
# OrderChecker v5.0

[![Build Linux](https://github.com/ВАШ_ЮЗЕРНЕЙМ/OrderChecker/actions/workflows/build.yml/badge.svg)](https://github.com/ВАШ_ЮЗЕРНЕЙМ/OrderChecker/actions/workflows/build.yml)

## Быстрая сборка

Нажмите **[⚡ Run workflow](https://github.com/ВАШ_ЮЗЕРНЕЙМ/OrderChecker/actions/workflows/build.yml)** для сборки Linux версии.
```

---

## 🔄 Автоматическая сборка

При каждом теге (tag) вида `v1.0` автоматически будет:
- Собираться бинарник
- Создаваться Release
- Файл будет доступен для скачивания

```bash
git tag v1.0
git push origin v1.0
```

---

## 📊 Статус сборки

После запуска увидите:
```
✅ Set up Python
✅ Install dependencies  
✅ Build with PyInstaller
✅ Upload artifact
```

---

## 🎉 Готово!

Через 3 минуты после нажатия "Run workflow" у вас будет **готовый Linux бинарник**!

**БЕСПЛАТНО и БЕЗ Docker на вашем Mac!**
