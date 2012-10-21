require 'fileutils'

RUBYVERSION = "1.9.3"

task :default => 'install'

desc "Meta-task to bring them all and in the darkness bind them"
task :install => [:setup_files, :setup_rvm, :setup_vim] do
  puts "Setup done"
end

desc "Set up dotfiles"
task :setup_files do
  puts "Setting up dotfiles"
  skip_all = false
  bckp_all = false
  ovwr_all = false

  Dir.glob("files/*").each do |file|
    abs_file  = File.join(Dir.pwd, file)
    target    = File.join(Dir.home, ".#{File.basename(file)}")

    bckp = false
    ovwr = false

    if File.exists?(target) || File.symlink?(target)

      next if File.realpath(target) == abs_file

      unless skip_all || ovwr_all || bckp_all
        puts "#{target} exists: [s]kip ([S] all), [o]verwrite ([O] all), [b]ackup ([B] all)"
        case STDIN.gets.chomp
          when 'o' then ovwr = true
          when 'b' then bckp = true
          when 'O' then ovwr_all = true
          when 'B' then bckp_all = true
          when 'S' then skip_all = true
          when 's' then next
        end
      end
      FileUtils.rm_rf(target) if ovwr || ovwr_all
      FileUtils.mv(target, "#{target}.backup") if bckp || bckp_all
    end
    FileUtils.ln_s(abs_file, target) unless skip_all
  end
end

desc "Set up rvm env (needs rvm installed)"
task :setup_rvm do
  puts "Setting up gemsets"
  begin
    require 'rvm'

    Dir.glob("gemsets/*[^.lock]").each do |gemfile|
      gemset = File.basename(gemfile).split("#")[0]
      if RVM.use! gemset
        system("bundle install --gemfile=#{gemfile}")
      end
    end
  rescue
    puts "RVM not found. Install steps:"
    puts "curl -L https://get.rvm.io | bash -s stable"
    puts "rvm requirements"
    puts "rvm install #{RUBYVERSION}"
  end
end

desc "Set up vim extensions"
task :setup_vim do
  puts "Setting up Vim"
  plugins_path = File.join("files/vim/bundle")
  FileUtils.mkdir_p plugins_path
  File.open("vim_plugins", "r").each_line do |line|
    name, url = line.split(" ")
    unless File.exists? File.join(plugins_path, name)
      puts "Fetching #{name}"
      %x(git clone -q #{url} #{File.join(plugins_path, name)})
    end
  end
end
