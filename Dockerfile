FROM ruby:3.2.2

# Создание пользователя app
RUN groupadd -r app && useradd -r -g app -m -d /app app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /app 
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# Установка гемов от имени пользователя app
RUN chown -R app:app /app
USER app
RUN bundle install

# Переключение обратно на root для добавления кода приложения
USER root
ADD . /app

# Запуск приложения от пользователя app
USER app
