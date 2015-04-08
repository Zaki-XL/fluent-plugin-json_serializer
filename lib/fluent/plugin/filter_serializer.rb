# -*- coding: utf-8 -*-
require 'oj'

module Fluent
  class Fluent::JsonSerializerFilter < Fluent::Filter
    Fluent::Plugin.register_filter('serializer', self)

    # config ------------------------------
    config_param :field_name, :string, :default => "message"

    # log Level ---------------------------
    unless method_defined?(:log)
      define_method("log") { $log }
    end

    # Load config -------------------------
    def configure(conf)
      super
    end

    # Start -------------------------------
    def start
      super
    end

    # Shutdown ---------------------------
    def shutdown
      super
    end

    # main --------------------------------

    # Edit Data
    def filter(tag, time, record)
      new_record = Hash.new()
      new_record[@field_name] = convert_to_json(record)

      # return
      new_record
    end

    # private -----------------------------
    private

    # Convert record to json
    def convert_to_json(record)
      Oj.dump(record, :mode => :compat)
    end

  end
end
