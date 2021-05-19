Подключим роль для установки jenkins командой 

ansible-galaxy install geerlingguy.jenkins

Запуск плейбука deploy-jenkins.yml выполнит установку сервиса.

Подключим роль nginx командой

ansible-galaxy install nginxinc.nginx_core

Далее запсук плейбука deploy-nginx.yml выполнит установку сервиса, заменит конфигурационный файл с настройкой для обратного прокси и перезапустит сервис.
