# 📦 OrderChecker v5.0 - Упаковка в исполняемый файл

## 🎯 Что это такое?

**PyInstaller** упаковывает Python приложение в **один исполняемый файл**:
- Windows → `.exe`
- Linux → бинарник
- macOS → `.app`

**Плюсы:**
- ✅ Один файл вместо папки с файлами
- ✅ Не требует установки Python
- ✅ Проще распространять

**Минусы:**
- ❌ Больший размер файла (~100-200MB)
- ❌ Медленнее запуск (распаковка)
- ❌ Антивирусы могут ругаться

---

## 🚀 Быстрая сборка

### Установка PyInstaller

```bash
pip3 install pyinstaller
```

### Сборка (одна команда)

```bash
cd OrderChecker_DEPLOY
bash build.sh
```

**Результат:**
- Linux: `dist/OrderChecker`
- macOS: `dist/OrderChecker.app`
- Windows: `dist/OrderChecker.exe`

---

## 🔧 Ручная сборка

### Linux (один файл)

```bash
pyinstaller \
  --onefile \
  --windowed \
  --name "OrderChecker" \
  --hidden-import=tkinter \
  --hidden-import=customtkinter \
  --hidden-import=pandas \
  --hidden-import=openpyxl \
  --hidden-import=docx \
  --hidden-import=pdfplumber \
  order_checker_v5_registry_learning.py
```

### Windows (exe)

```bash
pyinstaller ^
  --onefile ^
  --windowed ^
  --name "OrderChecker" ^
  --icon=icon.ico ^
  --hidden-import=tkinter ^
  --hidden-import=customtkinter ^
  order_checker_v5_registry_learning.py
```

### macOS (app)

```bash
pyinstaller \
  --onefile \
  --windowed \
  --name "OrderChecker" \
  --icon=icon.icns \
  order_checker_v5_registry_learning.py
```

---

## 📦 Опции PyInstaller

| Опция | Описание |
|-------|----------|
| `--onefile` | Один файл (рекомендуется) |
| `--windowed` | Без консоли (для GUI) |
| `--name` | Имя приложения |
| `--icon` | Иконка |
| `--hidden-import` | Явный импорт модулей |

---

## 🎨 Иконки

### Создание иконки

**Linux/macOS** - `.png`:
```bash
# Используйте любую картинку 512x512 PNG
convert icon.png -define icon:auto-resize=256,128,96,64,48,32,16 icon.ico
```

**Windows** - `.ico`:
```bash
# Online: https://convertio.co/png-ico/
# Или GIMP: Export as .ico
```

**macOS** - `.icns`:
```bash
# Online: https://cloudconvert.com/png-to-icns
# Или через IconUtil
```

---

## 📂 Альтернатива: один файл + данные

Если нужен меньший размер:

```bash
# Создаёт папку с EXE и зависимостями
pyinstaller --onedir --windowed OrderChecker.py

# Размер: ~50MB вместо ~150MB
# Запуск: OrderChecker/OrderChecker.exe
```

---

## ✅ Тестирование сборки

```bash
# Linux
./dist/OrderChecker

# macOS
open dist/OrderChecker.app

# Windows
OrderChecker.exe
```

---

## 🐛 Типичные проблемы

### Ошибка: "Module not found"

**Решение:** Явный импорт
```bash
pyinstaller --hidden-import=missing_module OrderChecker.py
```

### Ошибка: "File too big"

**Решение:** Используйте UPX сжатие
```bash
pip3 install pyinstaller[encryption]
pyinstaller --upx-dir=/usr/bin OrderChecker.py
```

### Ошибка: "Antivirus detects virus"

**Решение:** Это ложное срабатывание (False Positive)
- Добавьте в исключения антивируса
- Подпишите сертификатом (для распространения)

---

## 📦 AppImage (Linux альтернатива)

```bash
# Установка
pip3 install python-appimage

# Сборка
python-appimage OrderChecker.py

# Результат: OrderChecker-x86_64.AppImage
# Запуск: ./OrderChecker-x86_64.AppImage
```

---

## 🎉 Готово!

После сборки у вас есть **один файл** который можно:
- 📧 Отправить по email
- 📤 Загрузить на сайт
- 💾 Скопировать на флешку
- 🚀 Передать любому пользователю

**Python НЕ требуется!**
