#!/bin/sh


# Путь к утилите поиска
FIND="/usr/bin/find"
# Путь к утилите удаления
RM="/usr/bin/rm"
# Путь к утилите xargs
XARGS="/usr/bin/xargs"

# Список каталогов с архивами бекапов
STOR="/mnt/storage1"

# Время хранения файлов (в днях)
TIME="300"

# Файл журнала, куда будут попадать имена удаленных файлов. Должен присутствовать с необходимыми правами.
LOGFILE="/var/log/cleanold.log"

# Если передали один параметр в командной строке - обновить переменную TIME
if [ -n "$1" ];
then TIME=$1
fi

# Если передали второй параметр - это путь к бэкапам, обновляем переменную STOR
if [ -n "$2" ];
then STOR=$2
fi


echo $(date +%F\ %T) "   запуск скрипта" >> $LOGFILE

# Перебираем каталоги и удаляем устаревшие бекапы
for i in $($FIND $STOR -type f -mtime +$TIME -print); do
	rm $i;
        echo $i "DELETED\n" >>$LOGFILE;
done

echo $(date +%F\ %T) "завершение работы скрипта" >> $LOGFILE
echo "-------------------------------------------" >> $LOGFILE

