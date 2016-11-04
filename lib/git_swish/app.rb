require 'git_swish/git_status'

module Git::Swish

  class App

    COMMANDS = ['git_add',
                'git_checkout',
                'git_diff',
                'git_reset',
                'git_rm',
                'git_status']

    def initialize(args)
      @args = args
    end

    def run()
      process_args()
      if command?
        if @command == "git_status"
          git_status()
        else
          command_with_arg()
        end
      else
        raise "Unknown command: #{@args.join(' ')}"
      end
    end

    protected

    def process_args()
      return if @args.length == 0
      @command = @args.shift if COMMANDS.include?(@args[0])
    end

    def command?
      !@command.nil?
    end

    def command_with_arg()
      cmd = @command.split('_')
      @args.map do |arg|
        case arg
        when /^([0-9]+)$/
          cmd << get_expanded_filepath($1)
        when /^([0-9]+)-([0-9]+)$/
          ($1..$2).each do |i|
            cmd << get_expanded_filepath(i)
          end
        else
          cmd << arg
        end
      end
      system cmd.join(' ')
    end

    def get_expanded_filepath(number)
      expanded = ENV["e#{number}"]
      raise "No argument for #{number} exists!" if expanded.nil?
      return expanded
    end

    def git_status()
      Git::Swish::parse_git_status(@args)
    end
  end
end
