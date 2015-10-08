require 'webmock/rspec'
require_relative '../models/thoughtworker'
require_relative '../models/jigsaw_manager'
require_relative '../models/stat_calculator'

WebMock.disable_net_connect!(allow_localhost: true)
