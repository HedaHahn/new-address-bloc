def greeting

  ARGV.each do |arg|
    puts "Hello, #{arg}!"
  end

end

greeting
