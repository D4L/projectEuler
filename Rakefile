$LOAD_PATH << './lib'
$LOAD_PATH << './src'
Dir.glob("./src/problem-*/*.rb").each do |srcfile|
  require srcfile
end

require 'testtools'
namespace "all" do
  desc "Compiles every file and returns time taken"
  task :time do
    Dir.glob("src/problem-*").each do |dir|
      puts "Problem " + dir.gsub(/src\/problem-/, '')
      Dir.glob(File.join(dir, "*.rb")) do |file|
        puts "\tIn Ruby: (#{file})"
        puts "\tTime taken: " +  gettime(File.basename(file, ".rb").to_sym.to_proc).to_s
      end
    end
  end

  desc "Compiles every file, returns time, and solution"
  task :full do
    Dir.glob("src/problem-*").each do |dir|
      puts "\nProblem " + dir.gsub(/src\/problem-/, '')
      Dir.glob(File.join(dir, "*.rb")) do |file|
        puts "\n\tIn Ruby: (#{file})"
        result = gettime(File.basename(file, ".rb").to_sym.to_proc, "full")
        puts "\tTime taken: " + result[0].to_s
        puts "\tComputed result: " + result[1].to_s
      end
    end
  end
end

desc "Find some common times to compare against"
task :time do
  gettime(Proc.new{(1..100).inject(&:+)}) #warm up le functions
  gettime(Proc.new{"aoeuueoa".reverse == "aoeuueoa"})
  puts "Time it takes to enter a function and leave: " + gettime(Proc.new{}).to_s
  puts "Time it takes to return a number: " + gettime(Proc.new{1}).to_s
  puts "Time it takes to add: " + gettime(Proc.new{1+1}).to_s
  puts "Time it takes to add and multiply: " + gettime(Proc.new{1 + 2 * 3}).to_s
  puts "Time it takes to run a function: " + gettime(Proc.new{gettime(Proc.new{})}).to_s
  puts "Time it takes to fill an array with 1000 elements: " + gettime(Proc.new{a = Array.new;(1..1000).each{|i|a.push(i)}}).to_s
  puts "Time it takes to iterate though and add 1000 numbers: " + gettime(Proc.new{sum = 0;(1..1000).to_a.each{|i| sum += i; sum}}).to_s
  puts "Time it takes to define a recursive fib. function and get 25th element: " + gettime(Proc.new{def fib(n); return n if n <= 1; fib(n-1)+fib(n-2);end;fib(25)}).to_s
  puts "Time it takes to ruby sort a 1000 number array: " + gettime(Proc.new{a=Array.new(1000){|i|Random.rand};a.sort}).to_s
  puts "Time it takes to selection sort a 1000 number array: " + gettime(Proc.new{a=Array.new(1000){|i|Random.rand};def s(a, i, j);t=a[i];a[i]=a[j];a[j]=t;end;def i(a);(0..(a.size-1)).each{|i|l=1;p=0;(i..(a.size-1)).each{|j|p,l=j,a[j] if a[j]<l};s(a,i,p);};end;i(a)}).to_s
end

namespace "specific" do
  desc "Find the solution to a specific solution"
  task :solution do
    print "Which solution would you like to view? "
    sol = STDIN.gets.chomp
    if not File.directory?("src/problem-"+sol)
      puts "This solution hasn't been implemented yet!"
      exit
    end
    ss = Hash.new
    Dir.glob("src/problem-"+sol).each do |dir|
      Dir.glob(File.join(dir, "*.rb")) do |file|
        result = gettime(File.basename(file, ".rb").to_sym.to_proc, "full")
        if ss[result[1]]
          ss[result[1]].push(File.basename(file, ".rb"))
        else
          ss[result[1]] = Array.new(1){File.basename(file, ".rb")}
        end
      end
    end
    puts "#{ss.size} solution#{ss.size > 1 ? 's':''} found:"
    ss.each_pair do |res, arr|
      print "\t#{res}. Programs that deliver this solution: "
      arr.each do |name|
        print "#{name} "
      end
    end
    print "\n"
  end

  desc "Get the entire result of a specific solution"
  task :full do
    print "Which solution would you like to view? "
    sol = STDIN.gets.chomp
    if not File.directory?("src/problem-"+sol)
      puts "This solution hasn't been implemented yet!"
      exit
    end
    Dir.glob("src/problem-"+sol).each do |dir|
      Dir.glob(File.join(dir, "*.rb")) do |file|
        puts "\n\tIn Ruby: (#{file})"
        result = gettime(File.basename(file, ".rb").to_sym.to_proc, "full")
        puts "\tTime taken: " + result[0].to_s
        puts "\tComputed result: " + result[1].to_s
      end
    end
  end

end
