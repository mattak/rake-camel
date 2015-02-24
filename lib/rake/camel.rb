require "rake/camel/version"

module Rake
  module Camel
    class << self
      def split_camelcase(word)
        word.gsub(/([A-Z])/, ':\1').downcase.split(/:/)
      end

      def search_tasks(input_name, task_names)
        input_name_splits = split_camelcase(input_name)

        task_names.reduce([]) do |sum, command|
          command_splits = split_camelcase(command)
          next sum unless command_splits.length == input_name_splits.length
          sum.push(command) if command_splits.zip(input_name_splits).reduce(true) { |sum, words| sum & words[0].start_with?(words[1]) }
          sum
        end
      end

      def invoke(search_name, task_names)
        match_task_names = search_tasks(search_name, task_names)
        raise "command not found" if match_task_names.empty?()
        raise "match more than one command: #{ match_task_names }" unless match_task_names.length == 1
        Rake::Task[match_task_names[0]].invoke
      end

      def rule()
        Rake::Task.create_rule('') do |t|
          invoke(t.name, Rake.application.tasks.reject{ |t| t.kind_of?(Rake::FileTask) }.collect{ |x| x.to_s })
        end
      end
    end
  end
end
