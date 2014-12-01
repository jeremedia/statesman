module Statesman
  require     'config'
  require    'machine'
  require   'callback'
  require      'guard'
  require    'version'
  module Adapters
    require       "memory"
  end

  # Example:
  #   Statesman.configure do
  #     storage_adapter Statesman::ActiveRecordAdapter
  #   end
  #
  def self.configure(&block)
    config = Config.new(block)
    @storage_adapter = config.adapter_class
  end

  def self.storage_adapter
    @storage_adapter || Adapters::Memory
  end
end
