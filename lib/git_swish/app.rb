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
        if arg =~ /[0-9]+/
          expanded = ENV["e#{arg}"]
          raise "No argument for #{arg} exists!" if expanded.nil?
          cmd << expanded
        else
          cmd << arg
        end
      end
      system cmd.join(' ')
    end

    def git_status()
      Git::Swish::parse_git_status(@args)
    end
  end
end
