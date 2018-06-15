Rails.application.configure do
  log_path = "#{Rails.root}/log/lograge_#{Rails.env}.log"
  config.lograge.logger = ActiveSupport::Logger.new log_path
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.lograge.custom_options = lambda do |event|    
    exceptions = ['controller', 'action', 'format', 'authenticity_token']
    data = {
      level:      'info',
      host:       event.payload[:host],
      ip:         event.payload[:ip],
      login_id:   event.payload[:login_id],
      username:   event.payload[:username],
      user_agent: event.payload[:user_agent],
      referer:    event.payload[:referer],
      time:       event.time,
      params:     event.payload[:params].except(*exceptions)
    }
    if event.payload[:exception] # FIX: It cannot log exceptions
      data[:level]               = 'fatal'
      data[:exception]           = event.payload[:exception]
      data[:exception_backtrace] = event.payload[:exception_object].backtrace[0..6]
    end
    data
  end
end
