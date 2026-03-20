import sys

# Убедитесь, что предоставлено имя файла
if len(sys.argv) != 2:
    print("Использование: python script.py <имя_файла>")
    sys.exit(1)

file_name = sys.argv[1]

# Чтение содержимого файла и удаление символов #
with open(file_name, "r", encoding="utf-8") as infile:
    content = infile.read()

# Удаляем все символы #
cleaned_content = content.replace("#", "")

# Запись очищенного содержимого обратно в файл
with open(file_name, "w", encoding="utf-8") as outfile:
    outfile.write(cleaned_content)
