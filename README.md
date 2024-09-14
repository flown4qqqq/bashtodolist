# bashtodolist
Седьмая лабораторная по ОСям

## Установка (только Linux)
1. Клонирование репозитория

```git clone https://github.com/flown4qqqq/bashtodolist.git```

2. Переход в директорию bashtodolist

```cd bashtodolist```

3. Установка

```sudo ./install.sh```

## Использование
1. Текущий список дел

    1. ```todo list``` --- список inprogress
    2. ```todo list -i ``` --- синоним ```todo list```
    3. ```todo list -d ``` --- список done
    4. ```todo list -a ``` --- все дела

2. Добавить дело

```todo add [text of thing]```

3. Перевести дело из inprogress в done

```todo mark [id]```
