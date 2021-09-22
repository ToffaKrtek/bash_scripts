#! /bin/bash
LANG="ru_RU.UTF-8"
# Полностью убрал начало -- скрипт на 19 строке
# В конфигурационном файле необзодимо прописать данные репозитория и пр.
# if [ -f ./gitlab-keys.config ]
# then
#    source $(pwd)/gitlab-keys.config
#    if [ "$URLREP" == "https://gitlab.com/yourrepo" ] || [ "$TOKENREP" == "tokken" ]
#    then
#        echo "Файл конфигурации не заполнен"
#        exit
#    fi
# else
#    echo "Отсутствует конфигурационный файл"
#    exit
# fi
# Сначала хотел сделать автозаполнение посредством конфигурационного файла, но потом понял, что по сути это бессмысленно
# Только усложняет установку -- оставил только, чтобы быть честным у обучении

# Добавляем ссылку
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash
# Устанавливаем - отвечаем да на все
yes | yum install gitlab-runner
#Включаем 
systemctl enable --now gitlab-runner
# Вылаем права
chown gitlab-runner:gitlab-runner /var/www/html/wordpress
gitlab-runner register
# gitlab-runner register --url $URLREP --registration-token $TOKENREP --executor shell
gitlab-runner verify
echo "Добавьте в пайплайне в секцию scripts для deploy строку: rsync -av --no-perms --no-owner --no-group --exclude ".git*" $CI_PROJECT_DIR/ /var/www/html/wordpress"
