Dir.glob(File.join("src/problem-*/*.rb")).each do |srcfile|
end

task :default do
  Dir.glob("problem-*").each do |dir|
    puts "Problem " + dir.gsub(/problem-/, '')
    Dir.glob(File.join(dir, "*.rb")) do |file|
      puts "In Ruby:"
      ruby file
    end
  end
end
