# "Remove this line and implement your solution" | halt_error
def luhn_double: . * 2 | if . > 9 then . - 9 else . end;

def luhn_check:
    gsub("\\s"; "") |
    if length < 2 then false  # Шаг 2: Проверка минимальной длины
    elif test("\\D") then false  # Шаг 2: Проверка цифр
    else
      [explode[] - 48]
      # | debug
      | reverse                 # Обрабатываем справа налево
      | to_entries              # Добавляем индексы (key=index, value=digit)
      | map(
          if .key % 2 == 1 then # Каждая вторая цифра (начиная с индекса 1)
             .value | luhn_double
          else
            .value              
          end
        )
      | add % 10 == 0
    end;

luhn_check