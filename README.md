# Timepad

[https://github.com/timepad/timepad\_api/wiki]

## Установка

Добавить в Gemfile строки:

    gem 'timepad'

Затем запустить:

    $ bundle

## Настройка

Для работы гема требуется в конфигурации указать `id` и `key`, которые можно найти на странице настроек вашей организации [http://mycompany.timepad.ru/profile]

    #config/initializers/timepad.rb
    Timepad.configure do |config|
      config.id  = 1
      config.key = 'abcde'
    end

## События

    # Получение списка событий
    Timepad.event.get_list :limit => 1, :order_by => :begin

## Списки рассылок

    # Создание списка рассылок
    Timepad.maillist.create 'maillist_title', [{email => 'test@example.com'}]

    # Получение списка рассылок
    maillists = Timepad.maillist.get_list

    # Выгрузка списка рассылок
    maillist = Timepad.maillist.get maillist_id

    # Добавление подписчика в рассылку
    Timepad.maillist.add_items maillist_id, [{email => 'test@exmaple.com'}]

## Письма рассылок

    # Отправка письма в рассылку
    Timepad.mail.create :subject => 'subject', :text => 'text', :maillists => [1,2], :subscribers => ['a@a.a', 'b@b.b']


