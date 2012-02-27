require 'rb-fsevent-legacy'

module Guard
  class Darwin < Listener 
    def initialize(*)
      super
      @fsevent = FSEvent::Stream.new
      @fsevent.watch do |e|
        files = modified_files(e.event_path)
        @callback.call(files) unless files.empty?
      end
    end

    def start
      super
      @fsevent.run
    end

    def stop
      super
      @fsevent.stop
    end

    def self.usable?(no_vendor = false)
      true 
    end

    def watch(directory)
      @fsevent.add_path directory
    end
  end
end

#now reinit the listener to use the new class
Guard.instance_eval do
  @listener = Guard::Listener.select_and_init(@options)
end
