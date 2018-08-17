# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.

**// Поскольку на на ЮТ, ни на 'harb' ничего из этого не меняют,
то и я менять не буду, а просто ознакомлюсь
По мере ознакомления я понял, что кое-что можно было бы и поменять;
ТАкже я понял, что если  директива закоментирована, 
то значит по умолчанию действует именно это значание;
**//- Позже я нашел пример, что это не так!!
Есть закомент.строка 
  # config.allow_unconfirmed_access_for = 2.days
а в Прим.выше указано:
"Значение по умолчанию - 0.days, что означает
    пользователь не может получить доступ к веб-сайту без подтверждения своей учетной записи."

**** Devise.setup do |config|****
*/ЯтП, что это можно не трогать;

   The secret key used by Devise. 
Devise uses this key to generate
   random tokens. Changing this key will render invalid all existing
   confirmation, reset password and unlock tokens in the database.
   Devise will use the `secret_key_base` as its `secret_key`
   by default. You can change it below and use your own secret key.
  # config.secret_key = '17e4ee644327fc224e0a46a526044d390d7b500a87af5a2a2732c7b9be23bb06fd33bc369205bfa079536bdf6dafe7ef6b29c0a6f2a297264d29fc3a1a5137bc'
  "Секретный ключ, используемый Devise.
Devise использует этот ключ для генерации случайных токенов. Изменение этого ключа сделает недопустимым все существующее подтверждение, сброс пароля и разблокирование токенов в базе данных.
    По умолчанию Devise будет использовать `secret_key_base` как свою` secret_key`. Вы можете изменить его ниже и использовать свой секретный ключ."

**//- при выполнении миграции БД User выдвло требование указать ... см.п.2.16 srv-osvita5-180619(devise):

config.secret_key = '69fdb1238f2cb72478ef964cd69f4273b47318216af87169db16093a46593827df07ecf48c9327f9f07fa9f4efe1de143254f255b4bd9b87381dda9fc5c2eccf'
- указываю;


**** ==> Controller configuration ****
*/На понял, к чему это, но менять не буду;

  Configure the parent class to the devise controllers.
  config.parent_controller = 'DeviseController'
Настройте родительский класс на контроллеры разработки.
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
*/Директива в этом разделе не закоментирована. 
Я не понял, нужно здесь менять адрес, или нет

  Configure the e-mail address which will be shown in Devise::Mailer,
  note that it will be overwritten if you use your own mailer class
  with default "from" parameter.
  Настройте адрес электронной почты, который будет отображаться в Devise :: Mailer,
   обратите внимание, что он будет перезаписан, если вы используете свой собственный почтовый класс
   с параметром «от» по умолчанию.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class responsible to send e-mails.
  # config.parent_mailer = 'ActionMailer::Base'

  **** ==> ORM configuration ****
*/ Это менять не надо

  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

**** ==> Configuration for any authentication mechanism ****
*/ЯтП, что здесь задаются параметры пользователя при регистрации;
По умолчанию - это только email,
но можно добавить [:username, :subdomain]
   Configure which keys are used when authenticating a user. The default is
   just :email. You can configure it to use [:username, :subdomain], so for
   authenticating a user, both parameters are required. Remember that those
   parameters are used only when authenticating and not when retrieving from
   session. If you need permissions, you should implement that in a before filter.
   You can also supply a hash where the value is a boolean determining whether
   or not authentication should be aborted when the value is not present.

   Настройте, какие ключи используются при аутентификации пользователя. 
По умолчанию используется
    просто: электронная почта. Вы можете настроить его для использования [: username,: subdomain], поэтому для
    для аутентификации пользователя требуются оба параметра. Помните, что эти
    параметры используются только при аутентификации, а не при извлечении из
    сессия. Если вам нужны разрешения, вы должны реализовать это в переднем фильтре.
    Вы также можете указать хэш, где значение является логическим, определяющим, будет ли
    или не аутентификация должна быть прервана, когда значение отсутствует.
   #config.authentication_keys = [:email]

   Configure parameters from the request object used for authentication. Each entry
   given should be a request method and it will automatically be passed to the
   find_for_authentication method and considered in your model lookup. For instance,
   if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
   The same considerations mentioned for authentication_keys also apply to request_keys.

   Настройте параметры из объекта запроса, используемого для аутентификации. Каждая запись
    данный должен быть методом запроса, и он будет автоматически передан в
    find_for_authentication и рассмотрен в вашем поиске модели. Например,
    если вы установили: request_keys в [: subdomain]: субдомен будет использоваться при аутентификации.
    Те же соображения, упомянутые для authentication_keys, также применяются к request_keys.
  # config.request_keys = []

   Configure which authentication keys should be case-insensitive.
   These keys will be downcased upon creating or modifying a user and when used
   to authenticate or find a user. Default is :email.
   Настройте, какие ключи аутентификации должны быть нечувствительны к регистру.
    Эти клавиши будут уменьшены при создании или изменении пользователя и при использовании
    для аутентификации или поиска пользователя. По умолчанию: электронная почта.
    
  config.case_insensitive_keys = [:email]

   Configure which authentication keys should have whitespace stripped.
   These keys will have whitespace before and after removed upon creating or
   modifying a user and when used to authenticate or find a user. Default is :email.
   Настройте, какие ключи аутентификации должны быть разделены пробелами.
    Эти ключи будут иметь пробелы до и после удаления при создании или
    изменение пользователя и использование для аутентификации или поиска пользователя. По умолчанию: электронная почта.
    
  config.strip_whitespace_keys = [:email]

  # Tell if authentication through request.params is enabled. True by default.
  # It can be set to an array that will enable params authentication only for the
  # given strategies, for example, `config.params_authenticatable = [:database]` will
  # enable it only for database (email + password) authentication.
  # config.params_authenticatable = true

  # Tell if authentication through HTTP Auth is enabled. False by default.
  # It can be set to an array that will enable http authentication only for the
  # given strategies, for example, `config.http_authenticatable = [:database]` will
  # enable it only for database authentication. The supported strategies are:
  # :database      = Support basic authentication with authentication key + password
  # config.http_authenticatable = false

  # If 401 status code should be returned for AJAX requests. True by default.
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. 'Application' by default.
  # config.http_authentication_realm = 'Application'

   It will change confirmation, password recovery and other workflows
   to behave the same regardless if the e-mail provided was right or wrong.
   Does not affect registerable.
   # config.paranoid = true
Он изменит подтверждение, восстановление пароля и другие рабочие процессы, чтобы вести себя одинаково независимо от того, было ли электронное письмо правильным или неправильным.
    Не влияет на регистрацию.

  # By default Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  # Notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to Devise's sessions controller by
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

   By default, Devise cleans up the CSRF token on authentication to
   avoid CSRF token fixation attacks. This means that, when using AJAX
   requests for sign in and sign up, you need to get a new CSRF token
   from the server. You can disable this option at your own risk.
  # config.clean_up_csrf_token_on_authentication = true
По умолчанию Devise очищает токен CSRF при аутентификации, чтобы избежать атак с фиксацией токена CSRF. Это означает, что при использовании запросов AJAX для входа и регистрации вам необходимо получить новый токен CSRF с сервера. Вы можете отключить этот параметр на свой страх и риск.

   When false, Devise will not attempt to reload routes on eager load.
   This can reduce the time taken to boot the app but if your application
   requires the Devise mappings to be loaded during boot time the application
   won't boot properly.'
  # config.reload_routes = true
Когда false, Devise не будет пытаться перезагружать маршруты при активной загрузке. Это может сократить время, затрачиваемое на загрузку приложения, но если вашему приложению требуется, чтобы сопоставления Devise загружались во время загрузки, приложение не загружается должным образом.

  **** ==> Configuration for :database_authenticatable ****
   For bcrypt, this is the cost for hashing the password and defaults to 11. If
   using other algorithms, it sets how many times you want the password to be hashed.
   
Для bcrypt это стоимость хэширования пароля и по умолчанию - 11. Если
    используя другие алгоритмы, он устанавливает, сколько раз вы хотите, чтобы пароль был хэширован.
    
  
   Limiting the stretches to just one in testing will increase the performance of
   your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
   a value less than 10 in other environments. Note that, for bcrypt (the default
   algorithm), the cost increases exponentially with the number of stretches (e.g.
   a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).

   Ограничение растяжек до одного при тестировании приведет к увеличению производительности
    ваш тестовый пакет резко. Однако СИЛЬНО РЕКОМЕНДУЕТСЯ не использовать
    значение менее 10 в других средах. Обратите внимание, что для bcrypt (по умолчанию
    алгоритм), стоимость увеличивается экспоненциально с количеством растяжек (например,
    значение 20 уже очень медленно: прим. 60 секунд для расчета 1).
    
  config.stretches = Rails.env.test? ? 1 : 11

  # Set up a pepper to generate the hashed password.
  # config.pepper = '6667c9d79afb316bb4f76c118267a0d35e03303d492e94a30cba6de849a7d6e520dd3b0445010cfef02c06630a4651d088b89b1e19a3e55bd653c14033d49959'

  # Send a notification to the original email when the user's email is changed.
  # config.send_email_changed_notification = false

  # Send a notification email when the user's password is changed.
  # config.send_password_change_notification = false

  **** ==> Configuration for :confirmable ****
*/- Кол-во дней без регистрации
   A period that the user is allowed to access the website even without
   confirming their account. For instance, if set to 2.days, the user will be
   able to access the website for two days without confirming their account,
   access will be blocked just in the third day. Default is 0.days, meaning
   the user cannot access the website without confirming their account.

   Период, когда пользователю разрешен доступ к веб-сайту даже без
    подтверждающие их учетную запись. Например, если установлено значение 2.days, пользователь будет
    возможность доступа к веб-сайту в течение двух дней без подтверждения их учетной записи,
    доступ будет заблокирован только в третий день. Значение по умолчанию - 0.days, что означает
    пользователь не может получить доступ к веб-сайту без подтверждения своей учетной записи.
    
  # config.allow_unconfirmed_access_for = 2.days

*/Смысл понятен
   A period that the user is allowed to confirm their account before their
   token becomes invalid. For example, if set to 3.days, the user can confirm
   their account within 3 days after the mail was sent, but on the fourth day
   their account can't be confirmed with the token any more.
   Default is nil, meaning there is no restriction on how long a user can take
   before confirming their account.'

  "Период, когда пользователю разрешено подтвердить свою учетную запись до
    токен становится недействительным. Например, если установлено значение 3.days, пользователь может подтвердить
    их счет в течение 3 дней после отправки почты, но на четвертый день
    их учет не может быть подтвержден с помощью токена.
    Значение по умолчанию равно нулю, то есть нет ограничений на то, как долго может
    перед подтверждением их учетной записи."
      
  # config.confirm_within = 3.days

   If true, requires any email changes to be confirmed (exactly the same way as
   initial account confirmation) to be applied. Requires additional unconfirmed_email
   db field (see migrations). Until confirmed, new email is stored in
   unconfirmed_email column, and copied to email column on successful confirmation.

  "Если true, требуется подтверждение любых изменений электронной почты (точно так же, как и
    подтверждение первоначальной учетной записи). Требуется дополнительная unconfirmed_email
    поле db (см. миграция). Пока не подтвердится, новое электронное письмо сохраняется в
    unconfirmed_email и скопировать столбец электронной почты в успешное подтверждение."
    
  config.reconfirmable = true

  Defines which key will be used when confirming an account
  Определяет, какой ключ будет использоваться при подтверждении учетной записи
  
  # config.confirmation_keys = [:email]

  **** ==> Configuration for :rememberable
   The time the user will be remembered without asking for credentials again.

   "Время, которое пользователь запомнит, не запрашивая учетные данные снова."
   
  # config.remember_for = 2.weeks

  Invalidates all the remember me tokens when the user signs out.
  "Недействительно все запоминающиеся мои токены, когда пользователь подписывается."
  
  config.expire_all_remember_me_on_sign_out = true

  If true, extends the user's remember period when remembered via cookie. '
  "Если true, расширяет период запоминания пользователя, когда он запоминается через файл cookie."
  # config.extend_remember_period = false


  Options to be passed to the created cookie. For instance, you can set
  secure: true in order to force SSL only cookies.

  "Параметры, которые необходимо передать в созданный файл cookie. Например, вы можете установить
   secure: true, чтобы принудительно использовать только cookie SSL."
   
  # config.rememberable_options = {}

  **** ==> Configuration for :validatable ****
  Range for password length.
  "Диапазон длины пароля." - от 6 до 128
  
  config.password_length = 6..128

  Email regex used to validate email formats. It simply asserts that
  one (and only one) @ exists in the given string. This is mainly
  to give user feedback and not to assert the e-mail validity.
  "Регулярное выражение электронной почты используется для проверки форматов электронной почты. Он просто утверждает, что один (и только один) @ существует в данной строке. Это в основном
   чтобы дать отзыв пользователей и не утверждать действительность электронной почты."
  
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
 

  **** ==> Configuration for :timeoutable ****
  The time you want to timeout the user session without activity. After this
  time the user will be asked for credentials again. Default is 30 minutes.
  "Время, когда вы хотите отключить сеанс пользователя без активности. После этого
   пользователь снова попросит ввести учетные данные. Значение по умолчанию - 30 минут."
   
  # config.timeout_in = 30.minutes

  **** ==> Configuration for :lockable ****
  Defines which strategy will be used to lock an account.
  :failed_attempts = Locks an account after a number of failed attempts to sign in.
  :none            = No lock strategy. You should handle locking by yourself.
  "Определяет, какая стратегия будет использоваться для блокировки учетной записи."
   : failed_attempts "= Заблокирует учетную запись после нескольких неудачных попыток входа."
   : none "= Нет стратегии блокировки. Вы должны управлять блокировкой самостоятельно."
  
  # config.lock_strategy = :failed_attempts

  Defines which key will be used when locking and unlocking an account
  "Определяет, какой ключ будет использоваться при блокировке и разблокировке учетной записи"
  
  # config.unlock_keys = [:email]

   Defines which strategy will be used to unlock an account.
   :email = Sends an unlock link to the user email
   :time  = Re-enables login after a certain amount of time (see :unlock_in below)
   :both  = Enables both strategies
   :none  = No unlock strategy. You should handle unlocking by yourself.

  "Определяет, какая стратегия будет использоваться для разблокировки учетной записи."
    : email = Отправляет ссылку разблокировки на адрес электронной почты пользователя
    : time = Повторное включение входа через определенное время (см. ниже unlock_in)
    : both = Включает обе стратегии
    : none = нет стратегии разблокировки. Вы должны самостоятельно разблокировать.
  
  # config.unlock_strategy = :both

   Number of authentication tries before locking an account if lock_strategy
   is failed attempts.
  "Количество попыток аутентификации перед блокировкой учетной записи, если lock_strategy
    неудачные попытки."
  
  # config.maximum_attempts = 20

   Time interval to unlock the account if :time is enabled as unlock_strategy.
Интервал времени, чтобы разблокировать учетную запись, если: время включено как unlock_strategy.

  # config.unlock_in = 1.hour

  Warn on the last attempt before the account is locked.
  Предупреждать о последней попытке до блокировки учетной записи.
  
  # config.last_attempt_warning = true

  **** ==> Configuration for :recoverable ****
   Defines which key will be used when recovering the password for an account
   Определяет, какой ключ будет использоваться при восстановлении пароля для учетной записи
   
  # config.reset_password_keys = [:email]

   Time interval you can reset your password with a reset password key.
   Don't put a too small interval or your users won't have the time to
   change their passwords.
  Интервал времени вы можете сбросить пароль с помощью клавиши сброса пароля.
    Не ставьте слишком маленький интервал, или у ваших пользователей не будет времени
    изменить свои пароли.
  
  config.reset_password_within = 6.hours

   When set to false, does not sign a user in automatically after their password is
   reset. Defaults to true, so a user is signed in automatically after a reset.
  Когда установлено значение false, автоматически не подписывает пользователя после того, как пароль
    сброс. По умолчанию используется значение true, поэтому пользователь автоматически подписывается после сброса.
  
  # config.sign_in_after_reset_password = true

  **** ==> Configuration for :encryptable****
   Allow you to use another hashing or encryption algorithm besides bcrypt (default).
   You can use :sha1, :sha512 or algorithms from others authentication tools as
   :clearance_sha1, :authlogic_sha512 (then you should set stretches above to 20
   for default behavior) and :restful_authentication_sha1 (then you should set
   stretches to 10, and copy REST_AUTH_SITE_KEY to pepper).
  Позвольте вам использовать другой алгоритм хэширования или шифрования, кроме bcrypt (по умолчанию).
    Вы можете использовать: sha1,: sha512 или алгоритмы других инструментов проверки подлинности как
    : clear_sha1,: authlogic_sha512 (тогда вы должны установить растягивание выше 20
    для поведения по умолчанию) и: restful_authentication_sha1 (тогда вы должны установить
    растягивается до 10 и копирует REST_AUTH_SITE_KEY в перец).
  #
   Require the `devise-encryptable` gem when using anything other than bcrypt
   Требовать «изобретать-зашифрованный» камень при использовании чего-либо другого, кроме bcrypt
   
  # config.encryptor = :sha512

  **** ==> Scopes configuration ****
   Turn scoped views on. Before rendering "sessions/new", it will first check for
   "users/sessions/new". It's turned off by default because it's slower if you
   are using only default views.
  Включите просмотренные области. Перед рендерингом «session / new» сначала будет проверяться
    «Пользователи / сессии / новый». Он отключен по умолчанию, потому что он медленнее, если вы
    используют только представления по умолчанию.
  
  # config.scoped_views = false

   Configure the default scope given to Warden. By default it's the first
   devise role declared in your routes (usually :user).
  Настройте область по умолчанию для Warden. По умолчанию это первый
    создайте роль, указанную в ваших маршрутах (обычно: пользователь).
  
  # config.default_scope = :user

   Set this configuration to false if you want /users/sign_out to sign out
   only the current scope. By default, Devise signs out all scopes.
  Установите для этой конфигурации значение false, если вы хотите / users / sign_out выйти из системы
    только текущий объем. По умолчанию Devise выдает все области видимости.
  
  # config.sign_out_all_scopes = true

  **** ==> Navigation configuration****
   Lists the formats that should be treated as navigational. Formats like
   :html, should redirect to the sign in page when the user does not have
   access, but formats like :xml or :json, should return 401.
 Перечисляет форматы, которые следует рассматривать как навигационные. Форматы, подобные
    : html, должен перенаправлять на страницу входа, когда пользователь не имеет
    доступ, но форматы, такие как: xml или: json, должны возвращать 401. 
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ['*/*', :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  **** ==> Mountable engine configurations ****
   When using Devise inside an engine, let's call it `MyEngine`, and this engine
   is mountable, there are some extra configurations to be taken into account.
   The following options are available, assuming the engine is mounted as:
  При использовании Devise внутри движка, давайте назовем его `MyEngine`, и этот движок
    монтируется, есть несколько дополнительных конфигураций, которые необходимо учитывать.
    Доступны следующие варианты, если двигатель установлен как:
    
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
